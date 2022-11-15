using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActionReplay : MonoBehaviour
{
    public bool isInReplayMode;
    private bool Flag;
    public bool repeat;
    private Rigidbody rigidbody;
    private List<ActionReplayRecord> actionReplayRecords = new List<ActionReplayRecord>();
    private float currentReplayIndex;
    private float indexChangeRate;

    void Start()
    {
        rigidbody = GetComponent<Rigidbody>();
    }

    void Update()
    {
     // if (Input.GetKeyDown(KeyCode.R))
     if(Flag)
        {
           //isInReplayMode = !isInReplayMode;

            if (isInReplayMode)
            {
                Debug.Log(" == 1");
                SetTransform(0);
                rigidbody.isKinematic = true;
            }
            else
            {
                Debug.Log(" == 2");
                SetTransform(actionReplayRecords.Count - 1);
                rigidbody.isKinematic = false;
            }
        }

        indexChangeRate = 0;

       // if (Input.GetKey(KeyCode.RightArrow))
       if(repeat)
        {
         //   Time.timeScale = 0.4f;
            indexChangeRate = 1;
        }

        if (Input.GetKey(KeyCode.LeftArrow))
        {
          //  Time.timeScale = 0.4f;
            indexChangeRate = -1;
        }

        if (Input.GetKey(KeyCode.LeftShift))
        {
          //  Time.timeScale = 0.4f;
            indexChangeRate *= 0.5f;
        }
    }

    private void FixedUpdate()
    {
        if (isInReplayMode == false)
        {
            actionReplayRecords.Add(new ActionReplayRecord { position = transform.position, rotation = transform.rotation });
        }
        else
        {
            float nextIndex = currentReplayIndex + indexChangeRate;

            if (nextIndex < actionReplayRecords.Count && nextIndex >= 0)
            {
                SetTransform(nextIndex);
            }
        }
    }

    private void SetTransform(float index)
    {
        currentReplayIndex = index;

        ActionReplayRecord actionReplayRecord = actionReplayRecords[(int)index];

        transform.position = actionReplayRecord.position;
        transform.rotation = actionReplayRecord.rotation;
    }

    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.CompareTag("StRecord"))
        {
            Flag = true;
            isInReplayMode = true;
            repeat = true;

        }
        if (other.gameObject.CompareTag("EnRecord"))
        {
            
            Time.timeScale = 0.4f;

        }
    }
}