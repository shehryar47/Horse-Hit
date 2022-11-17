using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class SaveGame
{
   
    public static void SetFoalIndex(int index)
    {
        PlayerPrefs.SetInt("FoalIndex", index);
    }
    public static int GetFoalIndex()
    {
       return PlayerPrefs.GetInt("FoalIndex");
    }
}
