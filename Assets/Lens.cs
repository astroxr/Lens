using UnityEngine;
using System.Collections;

public class Lens : MonoBehaviour {

	// Use this for initialization
	void Start () {
		var effect = GetComponent<Schwarzschild> ();
		if (effect == null) {
			effect = gameObject.AddComponent<Schwarzschild> ();
		}
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
