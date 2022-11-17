using MalbersAnimations.Selector;
using System;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UIManagerMain : MonoBehaviour
{
    public static UIManagerMain instance;
    public Button UpdgradeHorseBtn,NextFoalBtn,PreviousFoalBtn,InventoryBtn;
    public GameObject FoalCanvas;
    public TextMeshProUGUI horseNameText, horseGenderText;
    public Slider Speed, Stamina;
    [HideInInspector]
    public SelectorController selectorController;
    


    // Start is called before the first frame update
    void Start()
    {
        instance = this;
        selectorController = BreedingManager.BreedingManagerInstance.selectorController;
        HorseChangeUI();
        InventoryBtn.onClick.AddListener(ShowInventory);
    }

    

    public void HorseChangeUI()
    {
        horseNameText.text = "Name : " + selectorController.CurrentItem.GetComponent<Horses>().horse.name;
        horseGenderText.text = "Gender : " + selectorController.CurrentItem.GetComponent<Horses>().horse.gender.ToString();
        Speed.value = (selectorController.CurrentItem.GetComponent<Horses>().horse.speed / 100);
        Stamina.value = (selectorController.CurrentItem.GetComponent<Horses>().horse.stamina / 100);
    }

    public void ShowInventory()
    {
        FoalCanvas.SetActive(false);
        BreedingManager.BreedingManagerInstance.stats.SetActive(true);
        BreedingManager.BreedingManagerInstance.Selector.SetActive(true);
        FoalManager.FoalManagerInstance.FoalCamera.gameObject.SetActive(false);  
    }
}
