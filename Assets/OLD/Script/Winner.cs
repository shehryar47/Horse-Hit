using UnityEngine;
using UnityEngine.AI;
public class Winner : MonoBehaviour
{
    public GameObject winnerHorse;
    public GameObject winnerStage;
    public bool winnerAnnounced = false;
    // Start is called before the first frame update
    private void OnTriggerEnter(Collider other)
    {
        if (!winnerAnnounced)
        {
            winnerHorse = other.gameObject;
            winnerHorse.GetComponent<NavMeshAgent>().speed = 0f;
            Invoke("AssignStage", 10f);
            winnerAnnounced = true;
        }

    }
    private void AssignStage()
    {

               winnerHorse.transform.position = new Vector3
               (winnerStage.transform.position.x,
               winnerStage.transform.position.y,
               winnerStage.transform.position.z);
        
        
    }
}
