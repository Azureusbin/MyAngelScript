class AIntroductionActor : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent SceneRoot;

    UPROPERTY(DefaultComponent, Attach = SceneRoot)
    UStaticMeshComponent MeshComponent;

    UPROPERTY(DefaultComponent, Attach = SceneRoot)
    UBillboardComponent BillboardComponent;

    UPROPERTY()
    TArray<int> Numbers;

    UPROPERTY()
    float CountdownDuration = 5.0f;

    float CurrentTimer = 0.0f;
    bool bCountdownActive = false;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        CurrentTimer = CountdownDuration;
        bCountdownActive = true;
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if (bCountdownActive)
        {
            CurrentTimer -= DeltaSeconds;

            if (CurrentTimer <= 0.0f)
            {
                Print("Countdown finished!");
                bCountdownActive = false;
            }
        }
    }
}