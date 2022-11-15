using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TextureSet : MonoBehaviour
{

    public Texture2D[] Texture2D;
    public Material material;
    public Texture2D[] GetParentTexture()
    {
        return Texture2D;
    }


    public void ChangeParentTexture()
    {
        material.mainTexture = Texture2D[Random.Range(0, Texture2D.Length)];
    }
}
