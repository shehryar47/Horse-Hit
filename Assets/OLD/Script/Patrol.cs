using UnityEngine;
using UnityEngine.AI;
using System.Collections;


public class Patrol : MonoBehaviour
{

    public Transform[] points;
    private int destPoint = 0;
    public NavMeshAgent agent;
    public Animator Anim;
    public Animator JockeyAnim;
    public bool flag;
    public static bool hasReachedLast = false;


    void Start()
    {
        // Anim = GetComponent<Animation>();

        agent = GetComponent<NavMeshAgent>();

        // Disabling auto-braking allows for continuous movement
        // between points (ie, the agent doesn't slow down as it
        // approaches a destination point).
        agent.autoBraking = false;
   
        Invoke("StartRun", 2.2f);
        
    }

    public void StartRun()
    {
       
        Anim.SetFloat("Speed", 3.5f);
        JockeyAnim.speed = Random.Range(1f, 1.5f);
        agent.speed=20f;
        Invoke("RandonSpeed", 2f);
        
    }

    void GotoNextPoint()
    {
        if (!hasReachedLast)
        {
            // Returns if no points have been set up
            if (points.Length == 0)
                return;

            // Set the agent to go to the currently selected destination.
            agent.destination = points[destPoint].position;

            // Choose the next point in the array as the destination,
            // cycling to the start if necessary.
            destPoint = (destPoint + 1) % points.Length;
        }
        
    }


    void Update()
    {
        //Anim.SetFloat("Speed", 3f);
        //agent.speed = Random.Range(2f, 3f);
        // Choose the next destination point when the agent gets
        // close to the current one.
        if (!agent.pathPending && agent.remainingDistance < 10f)
        {
            GotoNextPoint();
        }

    }
    public void RandonSpeed()
    {
        if (!flag)
        {
            agent.speed = Random.Range(38f, 39f); 
            Anims(agent.speed/10);
            Invoke("RandonSpeed", 2.0f);
        }
        else
        {
            agent.speed = 0;
            Anims(agent.speed / 10);
            return;
        }


    }
    public void Stoping()
    {
        flag = true;
        Anim.SetBool("SpeedRunToRun", true);
        Anim.SetBool("RunToWALK", true);
        Anim.SetBool("WalkToIdle02", true);
        JockeyAnim.SetBool("IdleToStart", false);
        JockeyAnim.Play("IdleEnd");


    }
    public void Anims(float AnimSpeed)
    {
        Anim.SetFloat("Speed", Mathf.Abs(AnimSpeed));
    }


    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag == "FinishLine")
        {
            Invoke("Stoping", 8.0f);
        }
        if(other.gameObject.tag == "point")
        {
            GameController.Intance.NextPointTrue();
            
        }
        
    }

}
