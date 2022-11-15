using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpriteLookAtCam : MonoBehaviour
{

    public GameObject Cam;
    public GameObject Cam3;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {

        transform.forward = Cam.transform.forward;
    }
}
