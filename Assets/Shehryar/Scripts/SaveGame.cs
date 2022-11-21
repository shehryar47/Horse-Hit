using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class SaveGame
{
    public static int FoalIndex;
    public static int HorseIndex=1;
    public static void SetFoalIndex(int index)
    {
        PlayerPrefs.SetInt("FoalIndex", index);
    }
    public static int GetFoalIndex()
    {
       return PlayerPrefs.GetInt("FoalIndex");
    }

   public static void SetTotalHorses()
    {
        HorseIndex++;
        PlayerPrefs.SetInt("HorseIndex", HorseIndex);
    }
    public static int GetTotalHorses()
    {
        return PlayerPrefs.GetInt("HorseIndex");
    }
}
