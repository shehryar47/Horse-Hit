using Cinemachine;
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Temp : MonoBehaviour
{

    public static Transform Checkline;
    public List<GameObject> TempHorseList = new List<GameObject>();
    public float[] Distances;
    public Text[] ranks;
    public Image[] ranksimg;
    public GameObject[] horses;
    public CinemachineTargetGroup cm;
    public static bool disableRankingSystem=false;

    // Start is called before the first frame update
    public void Awake()
    {
        

    }
    void Start()
    {      
      
            for (int i = 0; i < horses.Length; i++)
            {
                
                    TempHorseList[i] = horses[i];
                    ranks[i].text = horses[i].gameObject.name;
                    ranksimg[i].sprite = horses[i].gameObject.GetComponent<SpriteRenderer>().sprite;
                
            }

        disableRankingSystem = false;

       Checkline = GameController.Intance.Points[0].transform;
        InvokeRepeating("RankingSystem", 1f, 1.2f);


    }
    //Developed by Shehryar Hassan the Syndicate Owner ok monday ko ko krai gai
    private void RankingSystem()
    {

        Debug.Log("Check disableRankingSystem  "+ disableRankingSystem);
        if (!disableRankingSystem) //set to true:this in FirstLine Class when horse win
        {
         
            for (int i = 0; i < horses.Length; i++)// To Store distances in the array for comparing, to setup the rank system
        {
            Distances[i] = Vector3.Distance(horses[i].transform.position, Checkline.transform.position);
            cm.m_Targets[i].weight = 1;

        }
        Array.Sort(Distances);

        for (int j = 0; j < cm.m_Targets.Length; j++) //To change the weight of target camera transforms 
        {
            if (Vector3.Distance(cm.m_Targets[j].target.position, Checkline.transform.position) <= Distances[0])
            {
                    
                    cm.m_Targets[j].weight = 100;
                }
        }
        
            for (int k = 0; k < Distances.Length; k++)
            {
                for (int i = 0; i < horses.Length; i++)
                {
                    if (Vector3.Distance(horses[i].transform.position, Checkline.transform.position) == Distances[k])
                    {
                     
                        TempHorseList[k] = horses[i];
                        if(k == 0)
                        {
                           
                            TempHorseList[k].transform.GetChild(7).GetChild(0).gameObject.SetActive(true);
                            TempHorseList[k].transform.GetChild(7).GetChild(1).gameObject.SetActive(false);
                            TempHorseList[k].transform.GetChild(7).GetChild(2).gameObject.SetActive(false);
                            TempHorseList[k].transform.GetChild(7).GetChild(3).gameObject.SetActive(false);
                        }
                        else if(k==1)
                        {
                            TempHorseList[k].transform.GetChild(7).GetChild(1).gameObject.SetActive(true);
                            TempHorseList[k].transform.GetChild(7).GetChild(0).gameObject.SetActive(false);
                            TempHorseList[k].transform.GetChild(7).GetChild(2).gameObject.SetActive(false);
                            TempHorseList[k].transform.GetChild(7).GetChild(3).gameObject.SetActive(false);
                        }
                        else if (k == 2)
                        {
                            TempHorseList[k].transform.GetChild(7).GetChild(2).gameObject.SetActive(true);
                            TempHorseList[k].transform.GetChild(7).GetChild(0).gameObject.SetActive(false);
                            TempHorseList[k].transform.GetChild(7).GetChild(1).gameObject.SetActive(false);
                            TempHorseList[k].transform.GetChild(7).GetChild(3).gameObject.SetActive(false);
                        }
                        else if (k == 3)
                        {
                            TempHorseList[k].transform.GetChild(7).GetChild(3).gameObject.SetActive(true);
                            TempHorseList[k].transform.GetChild(7).GetChild(0).gameObject.SetActive(false);
                            TempHorseList[k].transform.GetChild(7).GetChild(2).gameObject.SetActive(false);
                            TempHorseList[k].transform.GetChild(7).GetChild(1).gameObject.SetActive(false);
                        }
                        else
                        {
                            TempHorseList[k].transform.GetChild(7).GetChild(0).gameObject.SetActive(false);
                            TempHorseList[k].transform.GetChild(7).GetChild(1).gameObject.SetActive(false);
                            TempHorseList[k].transform.GetChild(7).GetChild(2).gameObject.SetActive(false);
                            TempHorseList[k].transform.GetChild(7).GetChild(3).gameObject.SetActive(false);
                        }
                        ranks[k].text = horses[i].gameObject.name;
                        ranksimg[k].sprite = horses[i].gameObject.GetComponent<SpriteRenderer>().sprite;
                    }
                }

            }
        }  
    }
    

}
