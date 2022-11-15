using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveAroundObject : MonoBehaviour
{
    [SerializeField]
    private float _mouseSensitivity = 3.0f;
    public float _ScrollSensitivity = 3.0f;

    private float _rotationY;
    private float _rotationX;
   // public float Zoom;

  float minFov = 15f;
  float MaxFov = 90f;

    public static MoveAroundObject moveAroundObject;
    
    public Transform _target;

    [SerializeField]
    private float _distanceFromTarget = 3.0f;

    private Vector3 _currentRotation;
    private Vector3 _smoothVelocity = Vector3.zero;

    [SerializeField]
    private float _smoothTime = 0.2f;

    [SerializeField]
    private Vector2 _rotationXMinMax = new Vector2(-40, 40);

    private void Start()
    {
        moveAroundObject = this;
    }

    void Update()
    {
        float mouseX = Input.GetAxis("Mouse X") * _mouseSensitivity;
        float mouseY = Input.GetAxis("Mouse Y") * _mouseSensitivity;
        float Zoom = Camera.main.fieldOfView;


        _rotationY += mouseX;
        _rotationX += mouseY;
        Zoom += Input.GetAxis("Mouse ScrollWheel") * _ScrollSensitivity;

        Zoom = Mathf.Clamp(Zoom, minFov, MaxFov);
        Camera.main.fieldOfView = Zoom;


        // Apply clamping for x rotation 
        _rotationX = Mathf.Clamp(_rotationX, _rotationXMinMax.x, _rotationXMinMax.y);

        Vector3 nextRotation = new Vector3(_rotationX, _rotationY);

        // Apply damping between rotation changes
        _currentRotation = Vector3.SmoothDamp(_currentRotation, nextRotation, ref _smoothVelocity, _smoothTime);
        transform.localEulerAngles = _currentRotation;

        // Substract forward vector of the GameObject to point its forward vector to the target
        transform.position = _target.position - transform.forward * _distanceFromTarget;
    }
}
