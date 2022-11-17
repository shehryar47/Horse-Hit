using JetBrains.Annotations;
using MalbersAnimations.Selector;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class BreedingManager : MonoBehaviour
{


    public static BreedingManager BreedingManagerInstance;
    public Material[] AllMaterial;
    public GameObject Male, Female, Foal;
    public Text MaleText, FemaleText, timer;
    public Button SelectBreedBtn, StartBreedBtn, GoToStableBtn, CheclFoalBtn;
    public SelectorController selectorController;
    public GameObject BreedCam, Selector, TransitionPanel, stats;
    public int breedTime;
    public Material MaleParentMat, FemaleParentMat;
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
        AssignButtons();
    }

    private void AssignButtons()
    {
        timer.text = breedTime.ToString();
        SelectBreedBtn.onClick.AddListener(SelectedForBreed);
        GoToStableBtn.onClick.AddListener(GoToStable);
        StartBreedBtn.onClick.AddListener(StartBreed);
        CheclFoalBtn.onClick.AddListener(FoalBirth);
    }


    #region SelectForBreedFunctions
    public void SelectedForBreed()
    {
        if (selectorController.CurrentItem.GetComponent<Horses>().horse.gender == HorseMaker.Gender.male)
        {
            MaleParentCheck = selectorController.CurrentItem;
            MaleText.text = MaleParentCheck.GetComponent<Horses>().horse.name;
            MaleParentMat = MaleParentCheck.GetComponent<Horses>().horse.material;
            Male.transform.ChildContainsName("hBody").GetComponent<SkinnedMeshRenderer>().material = MaleParentMat;

        }
        else if (selectorController.CurrentItem.GetComponent<Horses>().horse.gender == HorseMaker.Gender.female)
        {
            FemaleParentCheck = selectorController.CurrentItem;
            FemaleText.text = FemaleParentCheck.GetComponent<Horses>().horse.name;
            FemaleParentMat = FemaleParentCheck.GetComponent<Horses>().horse.material;
            Female.transform.ChildContainsName("hBody").GetComponent<SkinnedMeshRenderer>().material = FemaleParentMat;
        }
    }
    #endregion

    public void GoToStable()
    {
        if(MaleParentCheck!=null && FemaleParentCheck !=null)
        {
            stats.SetActive(false);
            BreedCam.SetActive(true);
            Selector.SetActive(false);
            StartBreedBtn.gameObject.SetActive(true);
        }
        else
        {
            stats.SetActive(false);
            Selector.SetActive(false);
            UIManagerMain.instance.FoalCanvas.SetActive(true);
            FoalManager.FoalManagerInstance.FoalCamera.gameObject.SetActive(true);
        }
    }

    public void StartBreed()
    {
        StartBreedBtn.gameObject.SetActive(false);
        timer.gameObject.SetActive(true);
        StartCoroutine(Timer());
        
    }

    IEnumerator Timer()
    {
        while (breedTime > 0)
        {
            yield return new WaitForSeconds(1);
            breedTime--;
            timer.text = breedTime.ToString();
        }
        TransitionPanel.SetActive(true);
        timer.gameObject.SetActive(false); 
        
        //Foal.SetActive(true);

    }

    public void FoalBirth()
    {

    }
}
