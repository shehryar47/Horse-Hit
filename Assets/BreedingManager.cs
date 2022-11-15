using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MalbersAnimations.Selector;
using UnityEngine.UI;
using Unity.VisualScripting;
using JetBrains.Annotations;

public class BreedingManager : MonoBehaviour
{
    public static BreedingManager BreedingManagerInstance;
    public Texture2D[] textures;
    public GameObject Male, Female,Foal;
    public Text MaleText, FemaleText,timer;
    public Button SelectBreedBtn, StartBreedBtn,GoToStableBtn,CheclFoalBtn;
    public SelectorController selectorController;
    public GameObject BreedCam,Selector,TransitionPanel;
    public int breedTime;
    public Texture MaleParentTex, FemaleParentTex;
    public MItem MaleParentCheck, FemaleParentCheck;
    void Start()
    {
        if (BreedingManagerInstance != null)
        {
            Destroy(gameObject);
        }
        else
        {
            BreedingManagerInstance = this; 
            DontDestroyOnLoad(gameObject);
        }
        timer.text = breedTime.ToString();
        SelectBreedBtn.onClick.AddListener(SelectedForBreed);
        GoToStableBtn.onClick.AddListener(GoToStable);
        StartBreedBtn.onClick.AddListener(StartBreed);
        CheclFoalBtn.onClick.AddListener(CheckFoal);    
    }


    #region SelectForBreedFunctions
    public void SelectedForBreed()
    {
        if (selectorController.CurrentItem.GetComponent<Horses>().horse.gender == HorseMaker.Gender.male)
        {
            MaleParentCheck = selectorController.CurrentItem;
            MaleText.text = MaleParentCheck.GetComponent<Horses>().horse.name;
            MaleParentTex = MaleParentCheck.GetComponentInChildren<Renderer>().material.mainTexture;
            Male.GetComponentInChildren<Renderer>().material.mainTexture = MaleParentTex; 
            
        }
        else if (selectorController.CurrentItem.GetComponent<Horses>().horse.gender == HorseMaker.Gender.female)
        {
            FemaleParentCheck= selectorController.CurrentItem;
            FemaleText.text = FemaleParentCheck.GetComponent<Horses>().horse.name;
            FemaleParentTex = MaleParentCheck.GetComponentInChildren<Renderer>().material.mainTexture;
            Female.GetComponentInChildren<Renderer>().material.mainTexture = FemaleParentTex;
        }
    }
    #endregion

    public void GoToStable()
    {
        if(MaleParentCheck != null&&FemaleParentCheck!=null)
        {

        }
        
    }

    public void StartBreed()
    {
        timer.gameObject.SetActive(true);
        StartCoroutine(Timer());
        Foal.GetComponentInChildren<Renderer>().material.mainTexture = MaleParentTex;
    }

    IEnumerator Timer()
    {
        while (breedTime > 0)
        {
            yield return new WaitForSeconds(1);
            breedTime--;  
            timer.text= breedTime.ToString();   
        }
        TransitionPanel.SetActive(true);
        //Foal.SetActive(true);

    }

    public void CheckFoal()
    {

    }
}
