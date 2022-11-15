using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using Cinemachine;

public class FirstLine : MonoBehaviour
{

    public enum CheckPointType {RankLine, Normal, SecondLast, Last, WinnerLine }

    public CheckPointType Point;

    private Transform Winner;

    private GameObject WinnerCam;

    public GameObject ScneCam;
    public Transform Winnerpoint;



    //[Header("if Last Line Se3lected")]
    //public GameObject[] AllHorses;

    private void Start()
    {
        
    }
    private void Update()
    {
        //GameController.Intance.WinnerCam.transform.LookAt(Winner, Vector3.left);
    }

    

    private void OnTriggerEnter(Collider other)
    {
        switch (Point)
        {
            case CheckPointType.Normal:
                {
                    
                    MoveAroundObject.moveAroundObject._target = other.transform;
                    gameObject.SetActive(false);
                    break;
                } 
            case CheckPointType.RankLine:
                {
                    Debug.Log("winner = " + other.gameObject.name);
                   // MoveAroundObject.moveAroundObject._target = other.transform;
                  //  gameObject.SetActive(false);
                    break;
                }
            case CheckPointType.SecondLast:
                {
                    GameController.Intance.FinalCam.SetActive(true);
                  //  GameController.Intance.Cam2.SetActive(false);
                    gameObject.SetActive(false);
                    Time.timeScale = 0.2f;
                    break;
                }
            case CheckPointType.Last:
                {
                    Time.timeScale = 0.1f;
                    Invoke("ScaleUP",0.5f);
                    gameObject.SetActive(true);
                    break;
                }
            case CheckPointType.WinnerLine:
                {
                    Temp.disableRankingSystem = true;
                    Winner = other.gameObject.transform;
                   // Time.timeScale = 1f;
                    WinnerCam = other.transform.GetChild(8).gameObject;
                    Invoke("WinnerCamra", 10.0f);
                    gameObject.SetActive(false);
                    break;
                }
        }
    }
    public void ScaleUP()
    {
        Time.timeScale = 1;
        Debug.Log("Scale check");
    }
    public void WinnerCamra()
    {
        
       Winner.transform.position = Winnerpoint.transform.position.z * Vector3.up*2.0f; 
        WinnerCam.SetActive(true); 
        UIManager.Instanc.WinnerPanal.SetActive(true);
        GameController.Intance.FinalCam.SetActive(false);
        GameController.Intance.FinalCam.SetActive(false);
    
    }
}
