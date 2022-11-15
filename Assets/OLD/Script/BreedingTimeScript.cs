using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class BreedingTimeScript : MonoBehaviour
{
    [Header("Timer Functionality variables")]
    public float timer;
    public TextMeshProUGUI timerOnUI;
    private int counter = 0;

    [Header("New Animal Panel variables")]
    public GameObject newAnimalPannel;
    public GameObject newHorse;
    public GameObject [] FoalHorses;
    public ParticleSystem particleSystem;   
    public GameObject buttons;
    [Header("Camera and canvas related variables")]
    public Camera camera;
    public GameObject canvas;
    public LayerMask layers1;
    public LayerMask layers2;
    public GameObject babyCamera;
    public GameObject breedOff;
    public GameObject Feedd;
    public GameObject  FoalBirthPlace;
    public GameObject SetFoalParent;
    int i;
    int active;
    bool breedstart;
    public HorsePlacer horsePlacer;
    /// <summary>
    /// ///////////////////////////////////////////////////////////////////////////////////////////////////
    /// </summary>
    private void Start() /////////////////////IdR
    {
        int active = PlayerPrefs.GetInt("Pos");

       // FoalHorses[a].transform.position = new Vector3(PlayerPrefs.GetFloat("PlayerX"), PlayerPrefs.GetFloat("PlayerY"), PlayerPrefs.GetFloat("PlayerZ"));
      /* for(int i = 0; i < a; i++)
        {
        FoalHorses[active].SetActive(true);
            return;
        }*/
       for(int i = active; i < FoalHorses.Length;i++)
        {
            FoalHorses[i].SetActive(true);
        }
        
    }

    private void Update()
    {
        if(breedstart)
        {
        if (TimerScript.isReady(ref timer) && counter<1)
        {
            counter++;
            ShowNewAnimal();
        } 
        else
        {
            TimerScript.DisplayTimer(timer, timerOnUI);
        }
        }
     
    }

    void ShowNewAnimal() //////IDR
    {
        //display new animal panel...
        //newAnimalPannel.SetActive(true);

        //Hide timer container...
        gameObject.SetActive(false);

        //hide the buttons...
        buttons.SetActive(false);

        //Set camera and canvas to display 3D horse prefab...
        //camera.cullingMask = layers1;
        //PopUp.SetActive(true);
        babyCamera.SetActive(true);

        particleSystem.gameObject.SetActive(true);
        particleSystem.Play();
        breedOff.SetActive(false);
        Feedd.SetActive(true);
      
     //  var horse= Instantiate(newHorse, FoalBirthPlace.transform.position, FoalBirthPlace.transform.rotation);
      //  horse.transform.SetParent(SetFoalParent.transform); 
        newHorse.SetActive(true);
        if(i < FoalHorses.Length)
        {
            print("i == " + i);
           
            FoalHorses[i].SetActive(true);
          //  horsePlacer.SaveData(i);
            FoalHorses[i].transform.GetChild(0).GetChild(0).GetComponent<Renderer>().material.mainTexture = newHorse.transform.GetChild(0).GetChild(0).GetComponent<Renderer>().material.mainTexture;
            //  PlayerPrefs.SetFloat("PlayerX", FoalHorses[i].transform.position.x);
            HorsePlacer.instance.SaveTexture(FoalHorses[i].transform.GetChild(0).GetChild(0).GetComponent<Renderer>().material.mainTexture);           
          //   PlayerPrefs.SetFloat("PlayerY", FoalHorses[i].transform.position.y);
          //  PlayerPrefs.SetFloat("PlayerZ", FoalHorses[i].transform.position.z);
            int v = PlayerPrefs.GetInt("Pos");
            i = v;
            i = i + 1; ;
            PlayerPrefs.SetInt("Pos", i);
        }
        breedstart = false;
        timer = 0.0f;


        //canvas.GetComponent<Canvas>().renderMode = RenderMode.ScreenSpaceCamera;
    }
    public void breedStart()
    {
        breedstart = true;
    }
 

    public void RemoveNewAnimalCanvas()
    {
        //hide animal panel...
        newAnimalPannel.SetActive(false);

        //Show buttons again...
        buttons.SetActive(true);

        //Set camera back to normal...
        camera.cullingMask = layers2;
        newHorse.SetActive(false);
        //PopUp.SetActive(false);
        canvas.GetComponent<Canvas>().renderMode = RenderMode.ScreenSpaceOverlay;
        timer = 180;
    }
}
