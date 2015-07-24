Shader "Lens/Schwarzschild" {

	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}

	SubShader {
		Pass {
			CGPROGRAM
			#pragma vertex   vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			struct v2f {
				float4 pos : SV_POSITION;
				float2 uv  : TEXCOORD0;
			};

			sampler2D _MainTex;
			float4    _MainTex_ST;

			v2f vert (appdata_base v) {
				v2f o;
				o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
				o.uv  = TRANSFORM_TEX (v.texcoord, _MainTex);
				return o;
			}

			fixed4 frag (v2f i) : SV_Target {
				// Input parameters
				const float fov    = 60.0;
				const float R_Schw = 2.0;
				const float D_BH   = 20.0;

				// Derived constants
				const float pi      = 3.14159;
				const float deg2rad = pi / 180.0;
				const float fov_rad = 60.0 * deg2rad;
				const float R_ring  = 5.2 * R_Schw / 2.0;

				// Texture mapping
				float2 R     = (i.uv - 0.5) * _ScreenParams.xy / _ScreenParams.y;
				float  theta = sqrt(dot(R, R)) * fov_rad; // angle of ray
				float  b     = sin(theta) * D_BH;         // impact parameter
				if (b < R_ring)
					return fixed4 (0,0,0,1);
				else {
					float beta = theta - 2.0 * R_Schw / b;
					return tex2D (_MainTex, R * beta / theta + 0.5);
				}
			}
			ENDCG
		}
	}
}
