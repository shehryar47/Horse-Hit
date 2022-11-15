using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;
using UnityEngine.UI;

[System.Serializable]
public class CoinSystem : MonoBehaviour
{
    public static CoinSystem inst;
    public int Coin,x;
    public Text TotalCoin;

    private void Awake()
    {
     
        inst = this;
    }
    private void Start()
    {
        x = 100000;
        x = PlayerPrefs.GetInt("TotalCoin");
         Coin = x;
        Coin = 10000;
        TotalCoin.text = Coin+"$".ToString();
    }
    public void FeedHay(int Price)
    {
        Coin = Coin - Price;
        PlayerPrefs.SetInt("TotalCoin", Coin);
        TotalCoin.text = Coin.ToString();
    }
    public void Purchasing(int value)
    {
        Coin = Coin - value;
        PlayerPrefs.SetInt("TotalCoin", Coin);
        TotalCoin.text = Coin.ToString();
    }



}
