Func _CreateGui()
    Local $iThree     = 3
    Local $iFive      = 5
    Local $iThirtyTwo = 32

    $aGui[$eHandle]      = GUICreate($aGui[$eTitle], $aGui[$eWidth], $aGui[$eHeight], $aGui[$eXPosition], $aGui[$eYPosition], $WS_POPUP)
                           GUISetFont(10, 400, Default, 'Consolas')


    $cImageNameLabel     = _CreateCustomLabel('', ($iFive * 3), $aSingleSprite[$eHeight] + ($iFive * 6), ($aGui[$eWidth] - ($iFive * 3)) * 0.95)
    $cDrawSpeedLabel     = _CreateCustomLabel($aTexts[$eSpeed], $iFive * 3, $aSingleSprite[$eHeight] + ($iFive * 13), ($aGui[$eWidth] - ($iFive * 3)) * 0.95)
    $cDrawSpeedInput     = GUICtrlCreateInput($iDrawDelay, ($iFive * 14), $aSingleSprite[$eHeight] + ($iFive * 14) - 1, ($iFive * 10), Default, $vONLYNUMBERINPUTS)

    $cPreviewButton      = _CreateCustomButton('⭠', ($iFive * 3), $aSingleSprite[$eHeight] + ($iFive * 20))
                           GUICtrlSetTip($iLASTCREATEDCONTROLID, $aTexts[$eButtonHintPrevious])

    $cReloadButton       = _CreateCustomButton('⭮', ($iFive * 3) + ($iThirtyTwo * 1) + ($iThree * 1), $aSingleSprite[$eHeight] + ($iFive * 20))
                           GUICtrlSetTip($iLASTCREATEDCONTROLID, $aTexts[$eButtonHintRerun])

    $cNextButton         = _CreateCustomButton('⭢', ($iFive * 3) + ($iThirtyTwo * 2) + ($iThree * 2), $aSingleSprite[$eHeight] + ($iFive * 20))
                            GUICtrlSetTip($iLASTCREATEDCONTROLID, $aTexts[$eButtonHintNext])

    $cDefaultColorButton = _CreateCustomColorButton(Chr(83), ($iFive * 3) + ($iThirtyTwo * 3) + ($iThree * 5), $aSingleSprite[$eHeight] + ($iFive * 20), $sDefaultColor)
    $cRedColorButton     = _CreateCustomColorButton(Chr(83), ($iFive * 3) + ($iThirtyTwo * 4) + ($iThree * 6), $aSingleSprite[$eHeight] + ($iFive * 20), $sRedColor)
    $cGreenColorButton   = _CreateCustomColorButton(Chr(83), ($iFive * 3) + ($iThirtyTwo * 5) + ($iThree * 7), $aSingleSprite[$eHeight] + ($iFive * 20), $sGreenColor)
    $cBlackColorButton   = _CreateCustomColorButton(Chr(83), ($iFive * 3) + ($iThirtyTwo * 6) + ($iThree * 8), $aSingleSprite[$eHeight] + ($iFive * 20), $sBlackColor)
    $cWhiteColorButton   = _CreateCustomColorButton(Chr(83), ($iFive * 3) + ($iThirtyTwo * 7) + ($iThree * 9), $aSingleSprite[$eHeight] + ($iFive * 20), $sWhiteColor)

    $cSaveButton         = _CreateCustomButton('🖫', ($iFive * 3) + ($iThirtyTwo * 8) + 34, $aSingleSprite[$eHeight] + ($iFive * 20), Default, 0)
                           GUICtrlSetTip($iLASTCREATEDCONTROLID, $aTexts[$eButtonHintSave])

    $cExitButton         = _CreateCustomButton('🞪', ($aGui[$eWidth] * 0.86), ($iFive * 3), Default, 2)

    $cPicture            = GUICtrlCreatePic('', ($iFive * 3), ($iFive * 3), $aSingleSprite[$eWidth], $aSingleSprite[$eHeight])

    _CreateGdiPlusBuffer()

    GUISetState(@SW_SHOW)
    Send('{RIGHT}')
EndFunc

Func _CreateCustomLabel($sText, $iLeft, $iTop, $iWidth = 32, $iHeight = 32)
    GUICtrlCreateLabel('', $iLeft, $iTop, $iWidth, 1)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    GUICtrlCreateLabel('', $iLeft + $iWidth, $iTop, 1, $iHeight)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    GUICtrlCreateLabel('', $iLeft, $iTop + $iHeight, $iWidth, 1)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    GUICtrlCreateLabel('', $iLeft, $iTop, 1, $iHeight)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    Return GUICtrlCreateLabel($sText, $iLeft + 7, $iTop + 8, $iWidth - 7, $iHeight - 8)
EndFunc

Func _CreateCustomButton($sText, $iLeft, $iTop, $sFont = Default, $iYOffset = 0, $iWidth = 32, $iHeight = 32)
    GUICtrlCreateLabel('', $iLeft, $iTop, $iWidth, 1)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    GUICtrlCreateLabel('', $iLeft + $iWidth, $iTop, 1, $iHeight)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    GUICtrlCreateLabel('', $iLeft, $iTop + $iHeight, $iWidth, 1)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    GUICtrlCreateLabel('', $iLeft, $iTop, 1, $iHeight)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    Local $cControl = GUICtrlCreateLabel($sText, $iLeft + 7, $iTop + 5 + $iYOffset, $iWidth - 7, $iHeight - 7)
                      GUICtrlSetFont($iLASTCREATEDCONTROLID, 16, 400, Default, $sFont)
                      GUICtrlSetCursor($iLASTCREATEDCONTROLID, 0)

    Return $cControl
EndFunc

Func _CreateCustomColorButton($sText, $iLeft, $iTop, $sColor, $sFont = 'Wingdings', $iWidth = 32, $iHeight = 32)
    GUICtrlCreateLabel('', $iLeft, $iTop, $iWidth, 1)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    GUICtrlCreateLabel('', $iLeft + $iWidth, $iTop, 1, $iHeight)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    GUICtrlCreateLabel('', $iLeft, $iTop + $iHeight, $iWidth, 1)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    GUICtrlCreateLabel('', $iLeft, $iTop, 1, $iHeight)
    GUICtrlSetBkColor($iLASTCREATEDCONTROLID, $vBORDERCOLOR)

    Local $sReplacedColor = StringReplace($sColor, '#', '0x')

    Local $cControl = GUICtrlCreateLabel($sText, $iLeft + 9, $iTop + 5, $iWidth - 9, $iHeight - 7)
                      GUICtrlSetFont($iLASTCREATEDCONTROLID, 16, 400, Default, $sFont)
                      GUICtrlSetCursor($iLASTCREATEDCONTROLID, 0)
                      GUICtrlSetColor($iLASTCREATEDCONTROLID, $sReplacedColor)

    Return $cControl
EndFunc
