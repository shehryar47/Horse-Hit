using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FoalBirth : MonoBehaviour
{
    public List<Texture2D> BirthTextures = new List<Texture2D>();
  
    private void OnEnable()
    {
        
        BirthOfFoal();
    }

    private void BirthOfFoal()
    {
        int rand = Random.Range(0, BirthTextures.Count);
        PlayerPrefs.SetInt("HorseTextureIndex", rand);
        gameObject.transform.GetChild(0).GetChild(0).GetComponent<Renderer>().material.mainTexture = BirthTextures[rand];
    }


    
}
