using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ReplayHorse : MonoBehaviour
{
    public GameObject [] Horses;
    // Start is called before the first frame update
    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.CompareTag("Horse"))
        {
            for (int i = 0; i < Horses.Length; i++)
            {
                Horses[i].GetComponent<TimeBody>().flag = true;
                Invoke("stopRewind", 2.0f);
            }
            GameController.Intance.CM.SetActive(false);
            GameController.Intance.RePlayCam.SetActive(true);
            gameObject.SetActive(false);
            UIManager.Instanc.LoadReplayPanel.SetActive(true);
           // Time.timeScale = 30.0f;
        }
    }
    public void stopRewind()
    {
        for (int i = 0; i < Horses.Length; i++)
        {
            Horses[i].GetComponent<TimeBody>().flag = true;
        }
        UIManager.Instanc.LoadReplayPanel.SetActive(false);
        Time.timeScale = 0.2f;
        Invoke("Timescale", 3.0f);
    }
    public void Timescale()
    {
        Time.timeScale = 1.0f;
    }


}
