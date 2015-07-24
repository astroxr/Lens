using UnityEngine;
using System.Collections;

public class Schwarzschild : MonoBehaviour {

	private Material material;

	// Use this for initialization
	void Awake() {
		Shader shader = Shader.Find("Lens/Schwarzschild");
		if (shader == null) {
			Debug.Log("Shader not found.");
			return;
		}
		material = new Material(shader);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
