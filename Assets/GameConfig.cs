using UnityEngine;

public static class GameConfig
{
    public static int Cash = 1000;
    public static void AddCash(int cash)
    {
        Cash += cash;
        PlayerPrefs.SetInt("Cash", Cash);
    }
    public static int GetCash()
    {
        return PlayerPrefs.GetInt("Cash");
    }
    public static bool RemoveCash(int cash)
    {
        if (Cash > 0 && Cash>=cash)
        {
            Cash -= cash;
            PlayerPrefs.SetInt("Cash", Cash);

            return true;
        }
        return false;
    }
    public static bool CheckFirstTime()
    {
        if (PlayerPrefs.HasKey("Cash"))
        {
            return false;
        }
        else
        {
            PlayerPrefs.SetInt("Cash", Cash);
            return true;
        }
    }
}
