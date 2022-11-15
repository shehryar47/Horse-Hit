using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class UIManager : MonoBehaviour
{
    public static UIManager Instanc;

    public GameObject BreadingCam;

    public GameObject Selecter;

    public GameObject WinnerPanal;

    public GameObject LoadReplayPanel;

    public GameObject MapCanvas;
    // Start is called before the first frame update
    void Start()
    {
       
        Instanc = this;
    }

    // Update is called once per frame
 
    public void BreadindButton()
    {
        Selecter.SetActive(false);
        BreadingCam.SetActive(true);
    }
    public void Back()
    {
        Selecter.SetActive(true);
        BreadingCam.SetActive(false);
    }
    public void ToMenu()
    {
        SceneManager.LoadScene(0);
        // SceneManager.LoadScene(SceneManager.GetActiveScene().Race_Ascot);
      //  Application.LoadLevel(Application.loadedLevel);
    }
    public void MapPanal()
    {
        MapCanvas.SetActive(true);
    }
    public void MapPanalFalse()
    {
        MapCanvas.SetActive(false);
    }

}
