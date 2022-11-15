using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class HorsePlacer : MonoBehaviour
{
    public List<Texture> tempHorseFoalstextures = new List<Texture>();
    public static List<Texture> horseFoalstextures = new List<Texture>();
    public List<GameObject> horsePositions = new List<GameObject>();
    public int saveIndex = 0;
    public static HorsePlacer instance;
    public Texture textured;
    private void Start()
    {
        if (instance != null)
        {
            Destroy(this.gameObject);
        }
        else
        {
            instance = this;
            DontDestroyOnLoad(gameObject);
        }
        LoadData();
        Loading();
    }

    private void LoadData()
    {
        var index = PlayerPrefs.GetInt("saveIndex");
     //int H = index;
        SaveData();
        //var index = PlayerPrefs.GetInt("saveIndex");
        for (int i = 0; i < index; i++)
        {
            horsePositions[i].SetActive(true);
        }
        for (int i = 0; i < index; i++)
        {
            try
            {

                horsePositions[i].transform.GetChild(i).GetChild(0).GetChild(0).GetComponent<Renderer>().material.mainTexture = tempHorseFoalstextures[i];

            }
            catch
            {
                Debug.Log("Array Completed");
            }
        }
    }

   public void SaveData()
    {
        PlayerPrefs.SetInt("saveIndex", 3);

    }
    public void SaveTexture(Texture texture)
    {
        tempHorseFoalstextures.Add(texture);
        horseFoalstextures.Add(texture);
        Saving();
    }

    void Saving()
    {
        Debug.Log("saved");
        Save save = new Save { texture = horseFoalstextures[0]};
        List<Save> saveDataList = new List<Save>();
        string saveData = JsonUtility.ToJson(save);
        File.WriteAllText(Application.dataPath + "/save.txt", saveData);



     /*   for (int i = 0; i < saveDataList.Count; i++)
        {

        }*/

    }

    void Loading()
    {
        if (File.Exists(Application.dataPath + "/save.txt"))
        {
            string data = File.ReadAllText(Application.dataPath + "/save.txt");
            Save save = JsonUtility.FromJson<Save>(data);
            Debug.Log(save);
        }
        else
        {
            Debug.Log("NoSaveData");
        }
    }


    public class Save
    {
        public Texture texture;

    }

}
