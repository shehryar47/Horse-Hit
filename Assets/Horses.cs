using System.Collections;
using UnityEngine;

public class Horses : MonoBehaviour
{
    public HorseMaker horse;

    private void Start()
    {
        
        if (PlayerPrefs.GetString(horse.name) == horse.name)
        {
            LoadHorse();
            Debug.Log("Load");
        }
        else
        {
            SaveHorse();
            Debug.Log("Saved");
        }
        StartCoroutine(ChangeHorseSkin());
        gameObject.name= horse.name;    
    }


    IEnumerator ChangeHorseSkin()
    {
        yield return new WaitForSeconds(0.5f);
        transform.ChildContainsName("hBody").GetComponent<SkinnedMeshRenderer>().material = BreedingManager.BreedingManagerInstance.AllMaterial[horse.MaterialId];
        horse.material = transform.ChildContainsName("hBody").GetComponent<SkinnedMeshRenderer>().material;

    }
    public void SaveHorse()
    {
        PlayerPrefs.SetString(horse.name, horse.name);
        PlayerPrefs.SetInt(horse.name + "material", horse.MaterialId);
        PlayerPrefs.SetFloat(horse.name + "stamina", horse.stamina);
        PlayerPrefs.SetFloat(horse.name + "speed", horse.speed);

    }
    public void LoadHorse()
    {
        horse.name = PlayerPrefs.GetString(horse.name);
        horse.MaterialId = PlayerPrefs.GetInt(horse.name + "material");
        horse.stamina = PlayerPrefs.GetFloat(horse.name + "stamina");
        horse.speed = PlayerPrefs.GetFloat(horse.name + "speed");
    }
}
