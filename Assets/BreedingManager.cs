using MalbersAnimations.Selector;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class BreedingManager : MonoBehaviour
{
    public int foalIndex;
    public int FoalsId;
    public bool BreedingStarted;
    public static BreedingManager BreedingManagerInstance;
    public Material[] AllMaterial;
    public GameObject Male, Female, Foal;
    public Text MaleText, FemaleText, timer;
    public Button SelectBreedBtn, StartBreedBtn, GoToStableBtn, GoToStableBreedBtn, GoInventoryBreedBtn, CheclFoalBtn, FoalIsReadyBtn, UpgradeHorseBtn;
    public SelectorController selectorController;
    public GameObject BreedCam, Selector, TransitionPanel, stats;
    public int breedTime;
    public Material MaleParentMat, FemaleParentMat;
    public MItem MaleParentCheck, FemaleParentCheck;
    public GameObject[] Foals;


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
        foalIndex = SaveGame.GetFoalIndex();
    }

    private void AssignButtons()
    {
        FoalIsReadyBtn.interactable = false;
        timer.text = breedTime.ToString();
        SelectBreedBtn.onClick.AddListener(SelectedForBreed);
        GoToStableBtn.onClick.AddListener(GoToStable);
        StartBreedBtn.onClick.AddListener(StartBreed);
        CheclFoalBtn.onClick.AddListener(FoalBirth);
        GoToStableBreedBtn.onClick.AddListener(GoToFoalStable);
        GoInventoryBreedBtn.onClick.AddListener(GoToInventory);
        FoalIsReadyBtn.onClick.AddListener(FoalIsReady);
        UpgradeHorseBtn.onClick.AddListener(UpgradeHorse);
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
        if (MaleParentCheck != null && FemaleParentCheck != null)
        {
            GoToBreeding();

        }
        else
        {
            GoToFoalStable();
        }
    }

    private void GoToBreeding()
    {
        if (BreedingStarted) StartBreedBtn.gameObject.SetActive(false);
        else { StartBreedBtn.gameObject.SetActive(true); }
        stats.SetActive(false);
        BreedCam.SetActive(true);
        Selector.SetActive(false);
        UIManagerMain.instance.BreedingCanvas.SetActive(true);

    }
    #region BreedingFunctions
    public void StartBreed()
    {
        if (!BreedingStarted)
        {
            BreedingStarted = true;
            StartBreedBtn.gameObject.SetActive(false);
            timer.gameObject.SetActive(true);
            StartCoroutine(Timer());

        }
        else
        {
            StartBreedBtn.gameObject.SetActive(false);
            Debug.Log("Breeding in Process");
        }

    }

    IEnumerator Timer()
    {
        while (breedTime > 0)
        {
            yield return new WaitForSeconds(1);
            breedTime--;
            timer.text = breedTime.ToString();
        }

        timer.gameObject.SetActive(false);
        BreedingStarted = false;
        FoalIsReadyBtn.interactable = true;
        FoalIsReadyBtn.transform.GetComponentInChildren<Text>().text = "Foal is Ready";
        breedTime = 5;
        //Foal.SetActive(true);

    }
    public void FoalBirth()
    {
        TransitionPanel.SetActive(false);
        GoToFoalStable();
        if (foalIndex < 3)
        {
            FoalManager.FoalManagerInstance.Foals[foalIndex].GetComponentInChildren<Horses>().horse.MaterialId =
                MaleParentCheck.GetComponent<Horses>().horse.MaterialId;
            FoalManager.FoalManagerInstance.Foals[foalIndex].GetComponentInChildren<Horses>().SaveHorse();
            foalIndex++;
            SaveGame.SetFoalIndex(foalIndex);
            FoalManager.FoalManagerInstance.LoadFoals();
        }


    }
    public void GoToFoalStable()
    {
        stats.SetActive(false);
        Selector.SetActive(false);
        UIManagerMain.instance.FoalCanvas.SetActive(true);
        UIManagerMain.instance.BreedingCanvas.SetActive(false);
        FoalManager.FoalManagerInstance.FoalCamera.gameObject.SetActive(true);
    }



    public void FoalIsReady()
    {
        TransitionPanel.SetActive(true);
        FoalIsReadyBtn.interactable = false;
        UIManagerMain.instance.BreedingCanvas.SetActive(false);
        FoalIsReadyBtn.transform.GetComponentInChildren<Text>().text = "Foal Birth in";
    }
    #endregion 
    public void GoToInventory()
    {
        UIManagerMain.instance.ShowInventory();
    }
    public void UpgradeHorse()
    {

        if (GameConfig.RemoveCash(200))
        {
            selectorController.CurrentItem.GetComponent<Horses>().horse.stamina += 10;
            selectorController.CurrentItem.GetComponent<Horses>().horse.speed += 10;
            selectorController.CurrentItem.GetComponent<Horses>().SaveHorse();
            UIManagerMain.instance.HorseChangeUI();
        }

    }







}
