using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System;

public class TimerScript : MonoBehaviour
{
    public static void DisplayTimer(float timerToDisplay, TextMeshProUGUI timerOnUI)
    {
        if (timerToDisplay < 0)
        {
            timerToDisplay = 0;
        }
        float minutes = Mathf.FloorToInt(timerToDisplay / 60);
        float seconds = Mathf.FloorToInt(timerToDisplay % 60);
        timerOnUI.text = string.Format("{0:00}:{1:00}", minutes, seconds);
    }

    public static bool isReady(ref float timerParameter)
    {
        if (timerParameter > 0)
        {
            timerParameter -= Time.deltaTime;
            return false;
        }
        else
        {
            return true;
        }
    }
}