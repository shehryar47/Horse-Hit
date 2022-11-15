using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class HorseMaker
{
    public enum Gender {male, female};
    public string name;
    public int stamina;
    public int speed;
    public Texture2D texture;
    public Gender gender;

    /*public void SaveHorse(int gender=0)
    {
        PlayerPrefs.SetString(name, this.name);
        PlayerPrefs.SetInt(this.name + "speed", speed);
        PlayerPrefs.SetInt(this.name + "stamina", speed);
        PlayerPrefs.SetInt(this.name + "gender", gender);
    }

    public void LoadHorse()
    {
        this.speed = PlayerPrefs.GetInt(this.name + "speed");
        this.stamina = PlayerPrefs.GetInt(this.name + "stamina");

        this.name = PlayerPrefs.GetString(name);
    }*/
}

