using UnityEngine;
using UnityEngine.AI;
#if ENABLE_INPUT_SYSTEM
using UnityEngine.InputSystem;
#endif

[RequireComponent(typeof(NavMeshAgent))]
public class PlayerInput : MonoBehaviour
{
   public CharacterController characterController;
    public float speed;
    private void Start()
    {
        characterController = GetComponent<CharacterController>();
        speed = gameObject.GetComponent<NavMeshAgent>().speed;
    }
    private void Update()
    {
        float Horizontal = Input.GetAxis("Horizontal");
        Vector3 movement = new Vector3(0, 0, Horizontal);
        characterController.Move(movement * Time.deltaTime * speed);
    }
}