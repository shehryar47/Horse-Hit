using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeCamera : MonoBehaviour
{

    public GameObject camToEnable;
    public GameObject camToDisable; 
    public GameObject rightCamera; 
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Horse"))
        {
            camToEnable.SetActive(true);
            camToDisable.SetActive(false);
        }
    }
    public void Start()
    {
        Invoke("RightCameraShift", 5f);
    }
    void RightCameraShift()
    {
        rightCamera.SetActive(true);    
    }
}
