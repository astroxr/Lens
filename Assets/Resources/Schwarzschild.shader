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
				float2 R  = (i.uv - 0.5) * _ScreenParams.xy / _ScreenParams.y;
				float  r2 = dot(R, R);
				return tex2D (_MainTex, R * r2 + 0.5);
			}
			ENDCG
		}
	}
}
