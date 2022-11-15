using System.Collections;
using UnityEngine;

public class BreedingSystem : MonoBehaviour
{
    public Texture2D[] textureArray;
    public Material material;
    int index;
    bool breedStarted;

    void Start()
    {
        breedStarted = true;    
       // StartCoroutine(ChangeHorseTexture());
    }

    // Update is called once per frame
    void Update()
    {

        
    }

    public IEnumerator ChangeHorseTexture()
    {
        Invoke("StopBreeding", 15f);
        while (breedStarted)
        {
            index = Random.Range(0, textureArray.Length);
            material.mainTexture = textureArray[index];
            yield return new WaitForSeconds(1f);
        }
    }

    void StopBreeding()
    {
        breedStarted = false;
    }
}

