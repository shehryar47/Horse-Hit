using Cinemachine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FoalManager : MonoBehaviour
{
    public static FoalManager FoalManagerInstance;
    public CinemachineVirtualCamera FoalCamera;
    public List<Transform> Foals;
    public int foalIndex;
    public Button FeedBtn;
    public float FeedTime;
    void Start()
    {
        LoadFoals();
        if (FoalManagerInstance != null)
        {
            Destroy(gameObject);
        }
        else
        {
            FoalManagerInstance = this;
            DontDestroyOnLoad(gameObject);
        }


        UIManagerMain.instance.NextFoalBtn.onClick.AddListener(Next);
        UIManagerMain.instance.PreviousFoalBtn.onClick.AddListener(Previous);
        FeedBtn.onClick.AddListener(FeedFoal);
    }

    public void LoadFoals()
    {
        int saveFoalsIndex = SaveGame.GetFoalIndex();
        for (int i = 0; i < saveFoalsIndex; i++)
        {
            Foals[i].gameObject.SetActive(true);
            Foals[i].GetComponentInChildren<Horses>().LoadHorse();
            var mat = Foals[i].GetComponentInChildren<Horses>().horse.MaterialId;
            Foals[i].GetChild(0).GetChild(0).GetComponent<SkinnedMeshRenderer>().material = BreedingManager.BreedingManagerInstance.AllMaterial[mat];

        }
    }

    public void FeedFoal()
    {
        //StartCoroutine(Timer());

    }

    IEnumerator Timer()
    {
        while (FeedTime > 0)
        {
            yield return new WaitForSeconds(1);
            FeedTime--;

        }
        //Foals[foalIndex].localScale += new Vector3(0.2f, 0.2f, 0.2f);

    }

    #region Next Previous Button
    public void Next()
    {
        if (foalIndex < Foals.Count - 1)
        {
            foalIndex++;
            FoalCamera.Follow = Foals[foalIndex];
        }
        else
        {
            foalIndex = 0;
            FoalCamera.Follow = Foals[foalIndex];
        }
    }
    public void Previous()
    {
        if (foalIndex == 0)
        {
            foalIndex = Foals.Count - 1;
            FoalCamera.Follow = Foals[foalIndex];

        }
        else
        {
            foalIndex--;
            FoalCamera.Follow = Foals[foalIndex];
        }
    }
    #endregion

    public void AddToInventory()
    {

    }
}
