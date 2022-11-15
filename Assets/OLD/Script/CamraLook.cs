using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CamraLook : MonoBehaviour
{
  static  int i = 0;
    public Transform [] NextPoint;

    public Transform Camra;

    //public  AudioSource Crowd;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {

        if(other.gameObject.CompareTag("point"))
        {
           other.enabled = false;
         //   Crowd.Play();
            Camra.position = NextPoint[i].position;
            i +=1;

        }
    }
}
