
event void OnClickedEvent(UButtonEx Button);

class UButtonEx : UButton
{
    UPROPERTY()
    bool bIsChecked = false;
    UPROPERTY()
    FButtonStyle CheckedStyle;
    UPROPERTY()
    FButtonStyle UncheckedStyle;
    UPROPERTY()
    OnClickedEvent OnButtonClicked;

    void BindEvent()
    {
        UncheckedStyle = WidgetStyle;
        OnClicked.AddUFunction(this, n"HandleClicked");
    }

    UFUNCTION()
    void HandleClicked()
    {
        OnButtonClicked.Broadcast(this);
    }

    UFUNCTION(BlueprintCallable, Category = "ButtonEx")
    void SetChecked(bool bNewChecked)
    {
        bIsChecked = bNewChecked;
        UpdateStyle();
    }

    void UpdateStyle()
    {
        if (bIsChecked)
        {
            SetStyle(CheckedStyle);
        }
        else
        {
            SetStyle(UncheckedStyle);
        }
    }
}