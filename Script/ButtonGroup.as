

class UButtonGroup : UObject
{
    UPROPERTY()
    TArray<UButtonEx> Buttons;

    UFUNCTION(BlueprintCallable)
    void AddButton(UButtonEx Button)
    {
        Buttons.Add(Button);
        Button.OnButtonClicked.AddUFunction(this, n"HandleButtons");
    }

    UFUNCTION(BlueprintCallable)
    void RemoveButton(UButtonEx Button)
    {
        Buttons.Remove(Button);
    }

    UFUNCTION(BlueprintCallable)
    bool ActivateButton(UButtonEx Button)
    {
        for (UButtonEx Btn : Buttons)
        {
            if (Btn == Button)
            {
                Btn.SetChecked(true);
                return true;
            }
        }

        return false;
    }

    UFUNCTION(NotBlueprintCallable)
    void HandleButtons(UButtonEx Button)
    {
        for (UButtonEx Btn : Buttons)
        {
            Btn.SetChecked(Btn == Button);
        }
    }
}