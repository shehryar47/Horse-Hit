using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShiftCamera : MonoBehaviour
{
    //public GameObject camToEnable;
    public GameObject leftCamera;
    public GameObject rightCamera;
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Horse"))
        {
            leftCamera.SetActive(true);
            rightCamera.SetActive(false);
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
