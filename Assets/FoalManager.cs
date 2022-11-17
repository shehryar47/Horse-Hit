using Cinemachine;
using System.Collections.Generic;
using UnityEngine;

public class FoalManager : MonoBehaviour
{
    public static FoalManager FoalManagerInstance;
    public CinemachineVirtualCamera FoalCamera;
    public List<Transform> Foals;
    public int foalIndex;
    void Start()
    {
        LoadFoals();
        FoalManagerInstance = this;
        UIManagerMain.instance.NextFoalBtn.onClick.AddListener(Next);
        UIManagerMain.instance.PreviousFoalBtn.onClick.AddListener(Previous);
    }

    private void LoadFoals()
    {
        int saveFoalsIndex = SaveGame.GetFoalIndex();
        for (int i = 0; i < saveFoalsIndex; i++)
        {
            Foals[i].gameObject.SetActive(true);
        }
    }

    #region Next Previous Button
    public void Next()
    {
        if (foalIndex < Foals.Count-1)
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
        if (foalIndex ==0)
        {
            foalIndex = Foals.Count -1;
            FoalCamera.Follow = Foals[foalIndex];
            
        }
        else
        {
            foalIndex--;
            FoalCamera.Follow = Foals[foalIndex];
        }
    }
    #endregion
}
