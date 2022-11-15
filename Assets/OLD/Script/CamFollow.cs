using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CamFollow : MonoBehaviour
{


    public Transform Target;

    public float SmoothSpeed;

    public Vector3 Offset; 

    // Update is called once per frame
    void LateUpdate()
    {
        Vector3 DesirePosition = Target.position + Offset;
        Vector3 SmoothPosition = Vector3.Lerp(Target.position, DesirePosition, SmoothSpeed);
        transform.position = SmoothPosition;
        transform.LookAt(Target);
      //  Time.timeScale = 0.5f;
    }
}
