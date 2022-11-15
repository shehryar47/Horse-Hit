using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;

public class YourClassName : MonoBehaviour
{
    [System.Serializable]
    //simple class for values we're going to record
    public class GoVals
    {
        public Vector3 position;
        public Quaternion rotation;
        
        //constructor
        public GoVals(Vector3 position, Quaternion rotation)
        {
            this.position = position;
            this.rotation = rotation;
        }
    }
    public bool st;
    public bool fn;
    //a list of recorded values
    List<GoVals> vals = new List<GoVals>();
    //are we recording?
    bool recording = false;
    //...are we replaying?
    bool replaying = false;
    //while replaying, an int to keep track of which frame we're on
    int replayFrame = 0;

    //cache of our transform
    Transform tf;

    void Start()
    {
        //cache it...
        tf = this.transform;
    }

    void Update()
    {
        if(st)
        {
         Record();
        }
       if(fn)
        {
        Replay();
        }
        
    }

    void Record()
    {
        if (!recording)
           
            return;

        //add a new value to our recorder list
        vals.Add(new GoVals(tf.position, tf.rotation));
    }

    void Replay()
    {
        if (!replaying) return;

        //if the frame we're going to try to replay exceeds available replayable frames...
        if (replayFrame >= vals.Count)
        {
            replayFrame = 0;
            replaying = false;
            
            //uncomment the next line if you want it to make a new recording next time, otherwise it will continue from where it left off
            //vals = new List<GoVals>() ;
            return;
        }
        //set our transform values
        tf.position = vals[replayFrame].position;
        tf.rotation = vals[replayFrame].rotation;
        //increment our frame
        replayFrame++;
    }

   public void OnGUI()
    {
        if (!replaying)
        {
            if (GUILayout.Button(recording ? "Stop Recording" : "Record"))
                recording = !recording;
        }

        if (!recording)
        {
            if (GUILayout.Button(replaying ? "Stop Replay" : "Replay"))
                replaying = !replaying;
        }
    }
}