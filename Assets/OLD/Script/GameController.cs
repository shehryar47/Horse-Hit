using UnityEngine;
using System;

public class GameController : MonoBehaviour
{


    public static GameController Intance;
    [Header("Static Class")]
  //public GameObject Cam1;
  //public GameObject Cam2;
    public GameObject CM;
   // public GameObject C1;
    public GameObject FinalCam;
    public GameObject RePlayCam;

    public GameObject ScneCam;
    bool flag;

    [Header("DistancePoints")]
    public GameObject[] Points;
    int i = 0;

    [Header("All Doors")]
    public Animator[] AllDoor;

    [Header("Audio Controller")]
    public AudioSource Gun;
    public AudioSource Crowd;
    public AudioSource HorseRun;
    // Start is called before the first frame update
    void Start()
    {
        Intance = this;
        Invoke("GunAudio", 1.0f);
        Invoke("GunAudio", 1.0f);
        Invoke("DoorOpenDelay", 2.0f);
        Invoke("SwitchCam", 4.0f);


    }

    // Update is called once per frame
    void Update()
    {

    }
    public void DoorOpenDelay()
    {
        for (int i = 0; i < AllDoor.Length; i++)
        {
            AllDoor[i].enabled = true;
        }
    }
   /* public void SwitchCam()
    {
        Cam2.SetActive(true);
        Cam1.SetActive(false);
    }*/
    public void GunAudio()
    {
        Gun.Play();
    }
    public void NextPointTrue()
    {
        try
        {
            if (i < Points.Length)
            {
                Points[i].SetActive(false);
                i++;
                Temp.Checkline = Points[i].transform;

            }
        }
        catch (Exception e)
        {
            Debug.Log(e);
        }
    }

}
