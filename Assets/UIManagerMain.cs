using MalbersAnimations.Selector;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class UIManagerMain : MonoBehaviour
{
    public int SelectedTrack = 0;
    public static UIManagerMain instance;
    public Button UpdgradeHorseBtn, NextFoalBtn, PreviousFoalBtn, InventoryBtn, SelectHorseBtn, TrackSelectBtn;
    public GameObject FoalCanvas, BreedingCanvas, TrackCanvas;
    public TextMeshProUGUI horseNameText, horseGenderText;
    public Slider Speed, Stamina;
    [HideInInspector]
    public SelectorController selectorController;
    public Text CashText;
    public Button[] tracks;



    // Start is called before the first frame update
    void Start()
    {

        instance = this;
        if (GameConfig.CheckFirstTime())
        {
            CashText.text = GameConfig.GetCash().ToString();

        }
        selectorController = BreedingManager.BreedingManagerInstance.selectorController;
        HorseChangeUI();
        InventoryBtn.onClick.AddListener(ShowInventory);
        SelectHorseBtn.onClick.AddListener(HorseSelected);
        TrackSelectBtn.onClick.AddListener(TrackSelection);
        TrackSelectBtn.GetComponent<Image>().sprite = tracks[SelectedTrack].GetComponent<Image>().sprite;
    }



    public void HorseChangeUI()
    {
        horseNameText.text = "Name : " + selectorController.CurrentItem.GetComponent<Horses>().horse.name;
        horseGenderText.text = "Gender : " + selectorController.CurrentItem.GetComponent<Horses>().horse.gender.ToString();
        Speed.value = (selectorController.CurrentItem.GetComponent<Horses>().horse.speed / 100);
        Stamina.value = (selectorController.CurrentItem.GetComponent<Horses>().horse.stamina / 100);
        CashText.text = GameConfig.GetCash().ToString();
    }

    public void ShowInventory()
    {
        FoalCanvas.SetActive(false);
        BreedingCanvas.SetActive(false);
        BreedingManager.BreedingManagerInstance.stats.SetActive(true);
        BreedingManager.BreedingManagerInstance.Selector.SetActive(true);
        BreedingManager.BreedingManagerInstance.BreedCam.SetActive(false);
        FoalManager.FoalManagerInstance.FoalCamera.gameObject.SetActive(false);
    }


    public void HorseSelected()
    {
        Debug.Log(selectorController.CurrentItem.GetComponent<Horses>().horse.name);
        switch (SelectedTrack)
        {
            case 0:
                SceneManager.LoadScene("RaceStadium");
                break;
            case 1:
                SceneManager.LoadScene("DesertStadium");
                break;
            case 2:
                SceneManager.LoadScene("GrassStadium");
                break;
            case 3:
                SceneManager.LoadScene("SnowRaceStadium");
                break;
            default:
                Debug.Log("No Scene in This Index");
                break;
        }
    }
    public void TrackSelection()
    {
        TrackCanvas.SetActive(true);
        BreedingManager.BreedingManagerInstance.stats.SetActive(false);
    }
    public void OnTrackSelection(int track)
    {
        TrackCanvas.SetActive(false);
        BreedingManager.BreedingManagerInstance.stats.SetActive(true);
        SelectedTrack = track;
        TrackSelectBtn.GetComponent<Image>().sprite = tracks[SelectedTrack].GetComponent<Image>().sprite;

    }
}
