using UnityEngine;
using System.Collections;

public class Schwarzschild : MonoBehaviour {

	private Material material = null;

	// Use this for initialization
	void Awake() {
		Shader shader = Shader.Find("Lens/Schwarzschild");
		if (shader != null) {
			material = new Material (shader);
		} else {
			Debug.Log ("Shader not found.");
		}
	}
	
	// Update is called once per frame
	void OnRenderImage(RenderTexture source, RenderTexture dest) {
		if (material != null) {
			Graphics.Blit (source, dest, material);
		} else {
			Graphics.Blit (source, dest);
		}
	}
}
