using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Horses : MonoBehaviour
{
    public HorseMaker horse;

    private void Start()
    {
        transform.ChildContainsName("hBody").GetComponent<SkinnedMeshRenderer>().material = BreedingManager.BreedingManagerInstance.AllMaterial[horse.MaterialId];
        horse.material=transform.ChildContainsName("hBody").GetComponent<SkinnedMeshRenderer>().material;
    }
    private void Update()
    {
       
    }
}
