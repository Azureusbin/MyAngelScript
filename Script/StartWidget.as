UCLASS(Abstract)
class UStartWidget : UUserWidget
{
    UPROPERTY()
    UButtonGroup ButtonGroup;

	UFUNCTION(BlueprintOverride)
	void Construct()
	{
        ButtonGroup = NewObject(this, UButtonGroup);

        TArray<UWidget> Widgets;
        GetAllWidgets(Widgets);

        for (UWidget Widget : Widgets)
        {
            UButtonEx Button = Cast<UButtonEx>(Widget);
            if (IsValid(Button))
            {
                Button.BindEvent();
                ButtonGroup.AddButton(Button);
            }
        }
	}
}

UFUNCTION(Category="Example")
void AddMyWidgetToHUD(APlayerController OwningPlayer, TSubclassOf<UUserWidget> WidgetClass)
{
    UUserWidget UserWidget = WidgetBlueprint::CreateWidget(WidgetClass, OwningPlayer);
    UserWidget.AddToViewport();

    if (OwningPlayer != nullptr)
    {
        OwningPlayer.bShowMouseCursor = true;
        Widget::SetInputMode_UIOnlyEx(OwningPlayer, nullptr);
    }
}