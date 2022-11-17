using UnityEngine;

public class Horses : MonoBehaviour
{
    public HorseMaker horse;

    private void Start()
    {
        if(PlayerPrefs.GetString(horse.name)== horse.name)
        {
            LoadHorse();
            Debug.Log("Load");
        }
        else
        {
            SaveHorse();
            Debug.Log("Saved");
        }
        transform.ChildContainsName("hBody").GetComponent<SkinnedMeshRenderer>().material = BreedingManager.BreedingManagerInstance.AllMaterial[horse.MaterialId];
        horse.material = transform.ChildContainsName("hBody").GetComponent<SkinnedMeshRenderer>().material;


    }

    public void SaveHorse()
    {
        PlayerPrefs.SetString(horse.name, horse.name);

    }
    public void LoadHorse()
    {
        horse.name = PlayerPrefs.GetString(horse.name);
    }
}
