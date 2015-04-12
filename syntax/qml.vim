" Vim syntax file

" Based on javascript syntax (as is QML)

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'qml'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("qml_fold")
  unlet qml_fold
endif


syn keyword javaScriptCommentTodo      TODO FIXME XXX TBD contained
syn match   javaScriptLineComment      "\/\/.*" contains=@Spell,javaScriptCommentTodo
syn match   javaScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  javaScriptComment	       start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo
syn match   javaScriptSpecial	       "\\\d\d\d\|\\."
syn region  javaScriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=javaScriptSpecial,@htmlPreproc
syn region  javaScriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=javaScriptSpecial,@htmlPreproc

syn match   javaScriptSpecialCharacter "'\\.'"
syn match   javaScriptNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  javaScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword javaScriptConditional	if else switch
syn keyword javaScriptRepeat		while for do in
syn keyword javaScriptBranch		break continue
syn keyword javaScriptOperator		new delete instanceof typeof
syn keyword javaScriptType		Array Boolean Date Function Number Object String RegExp
syn keyword javaScriptStatement		return with
syn keyword javaScriptBoolean		true false
syn keyword javaScriptNull		null undefined
syn keyword javaScriptIdentifier	arguments this var const
syn keyword javaScriptLabel		case default
syn keyword javaScriptException		try catch finally throw
syn keyword javaScriptMessage		alert
syn keyword javaScriptGlobal		parent
syn keyword javaScriptReserved		abstract boolean byte char class enum export extends final float goto implements interface long native package private protected public short static super synchronized throws transient volatile

syn match javaScriptStrictS		"^\s*'use strict';$"
syn match javaScriptStrictD		"^\s*\"use strict\";$"
syn keyword javaScriptTypedArray	ArrayBuffer Int8Array Uint8Array Uint8ClampedArray Int16Array Uint16Array Int32Array Uint32Array Float32Array Float64Array

syn keyword qmlError			debugger
syn match   qmlObjectLiteralType	"[A-Za-z][_A-Za-z0-9]*\s*\({\)\@="
syn match   qmlNonBindingColon		"?[^;]*:"
syn match   qmlBindingProperty		"\<[A-Za-z][_A-Za-z.0-9]*\s*:"
syn keyword qmlOn			on
syn match   qmlChanged			"Changed"
syn keyword qmlPragma			pragma
syn keyword qmlImport			import
syn keyword qmlTypeDef			alias
syn keyword qmlDeclaration		property signal
syn keyword qmlStorageClass		readonly
syn keyword qmlDebug			console assert debug dirxml error info log profile profileEnd time timeEnd timeStamp trace warn
syn keyword qmlBasicType bool color coordinate date double font geocircle georectangle geoshape int list matrix4x4 point quaternion real rect size string url variant vector2d vector3d vector4d
syn keyword qmlAllType Accelerometer AccelerometerReading Accessible Action Address Affector Age Altimeter AltimeterReading AmbientLightReading AmbientLightSensor AmbientTemperatureReading AmbientTemperatureSensor AnchorAnimation AnchorChanges AngleDirection AnimatedImage AnimatedSprite Animation AnimationController Animator ApplicationWindow ApplicationWindowStyle AttenuationModelInverse AttenuationModelLinear Attractor Audio AudioCategory AudioEngine AudioListener AudioSample Behavior Binding Blend BluetoothDiscoveryModel BluetoothService BluetoothSocket BorderImage BrightnessContrast BusyIndicator BusyIndicatorStyle Button ButtonStyle Calendar CalendarStyle Camera CameraCapture CameraExposure CameraFlash CameraFocus CameraImageProcessing CameraRecorder Canvas CanvasGradient CanvasImageData CanvasPixelArray Category CategoryModel CheckBox CheckBoxStyle CloseEvent ColorAnimation ColorDialog ColorOverlay Colorize Column ColumnLayout ComboBox ComboBoxStyle Compass CompassReading Component ConicalGradient Connections ContactDetail ContactDetails Context2D CoordinateAnimation CumulativeDirection CustomParticle Date DelegateModel DelegateModelGroup Desaturate Dialog Direction DirectionalBlur Displace DistanceReading DistanceSensor DoubleValidator Drag DragEvent DropArea DropShadow DwmFeatures EditorialModel EllipseShape Emitter EnginioClient EnginioModel EnginioOAuth2Authentication EnginioReply ExclusiveGroup ExtendedAttributes FastBlur FileDialog FinalState Flickable Flipable Flow FocusScope FolderListModel FontDialog FontLoader FontMetrics Friction GammaAdjust GaussianBlur GeocodeModel Glow Gradient GradientStop Gravity Grid GridLayout GridMesh GridView GroupBox GroupGoal Gyroscope GyroscopeReading HistoryState HolsterReading HolsterSensor HueSaturation IRProximityReading IRProximitySensor Icon Image ImageModel ImageParticle InnerShadow Instantiator IntValidator Item ItemGrabResult ItemParticle JumpList JumpListCategory JumpListDestination JumpListLink JumpListSeparator KeyEvent KeyNavigation Keys Label Layout LayoutMirroring LevelAdjust LightReading LightSensor LineShape LinearGradient ListElement ListModel ListView Loader Locale Location Magnetometer MagnetometerReading Map MapCircle MapGestureArea MapItemView MapPinchEvent MapPolygon MapPolyline MapQuickItem MapRectangle MapRoute MapType MaskShape MaskedBlur Matrix4x4 MediaPlayer Menu MenuBar MenuBarStyle MenuItem MenuSeparator MenuStyle MessageDialog MouseArea MouseEvent MultiPointTouchArea NdefFilter NdefMimeRecord NdefRecord NdefTextRecord NdefUriRecord NearField Number NumberAnimation ObjectModel OpacityAnimator OpacityMask OpenGLInfo OrientationReading OrientationSensor Package ParallelAnimation ParentAnimation ParentChange Particle ParticleGroup ParticlePainter ParticleSystem Path PathAnimation PathArc PathAttribute PathCubic PathCurve PathElement PathInterpolator PathLine PathPercent PathQuad PathSvg PathView PauseAnimation PinchArea PinchEvent Place PlaceAttribute PlaceSearchModel PlaceSearchSuggestionModel PlayVariation Plugin PluginParameter PointDirection Position PositionSource Positioner PressureReading PressureSensor ProgressBar ProgressBarStyle PropertyAction PropertyAnimation PropertyChanges ProximityReading ProximitySensor QAbstractState QAbstractTransition QSignalTransition Qt QtMultimedia QtObject QtPositioning RadialBlur RadialGradient Radio RadioButton RadioButtonStyle RadioData Ratings Rectangle RectangleShape RectangularGlow RecursiveBlur RegExpValidator Repeater ReviewModel Rotation RotationAnimation RotationAnimator RotationReading RotationSensor Route RouteManeuver RouteModel RouteQuery RouteSegment Row RowLayout Scale ScaleAnimator Screen ScriptAction ScrollView ScrollViewStyle Sensor SensorGesture SensorGlobal SensorReading SequentialAnimation Settings ShaderEffect ShaderEffectSource Shape SignalSpy SignalTransition Slider SliderStyle SmoothedAnimation Sound SoundEffect SoundInstance SpinBox SpinBoxStyle SplitView SpringAnimation Sprite SpriteGoal SpriteSequence Stack StackView StackViewDelegate State StateChangeScript StateGroup StateMachine StatusBar StatusBarStyle String Supplier Switch SwitchStyle SystemPalette Tab TabView TabViewStyle TabWidget TableView TableViewColumn TableViewStyle TapReading TapSensor TargetDirection TaskbarButton TestCase Text TextArea TextAreaStyle TextEdit TextField TextFieldStyle TextInput TextMetrics ThresholdMask ThumbnailToolBar ThumbnailToolButton TiltReading TiltSensor TimeoutTransition Timer ToolBar ToolBarStyle ToolButton Torch TouchPoint TrailEmitter Transform Transition Translate Turbulence UniformAnimator User Vector3dAnimation Video VideoOutput ViewTransition VisualDataGroup VisualDataModel VisualItemModel Wander WebChannel WebEngineLoadRequest WebEngineView WebLoadRequest WebSocket WebSocketServer WebView WheelEvent Window WorkerScript XAnimator XmlListModel XmlRole YAnimator ZoomBlur



if exists("qml_fold")
    syn match	javaScriptFunction	"\<function\>"
    syn region	javaScriptFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match javaScriptSync	grouphere javaScriptFunctionFold "\<function\>"
    syn sync match javaScriptSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword javaScriptFunction	function
    syn match	javaScriptBraces	   "[{}\[\]]"
    syn match	javaScriptParens	   "[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "qml"
  syn sync ccomment javaScriptComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_qml_syn_inits")
  if version < 508
    let did_qml_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink javaScriptComment		Comment
  HiLink javaScriptLineComment		Comment
  HiLink javaScriptCommentTodo		Todo
  HiLink javaScriptSpecial		Special
  HiLink javaScriptStringS		String
  HiLink javaScriptStringD		String
  HiLink javaScriptCharacter		Character
  HiLink javaScriptSpecialCharacter	javaScriptSpecial
  HiLink javaScriptNumber		javaScriptValue
  HiLink javaScriptConditional		Conditional
  HiLink javaScriptRepeat		Repeat
  HiLink javaScriptBranch		Conditional
  HiLink javaScriptOperator		Operator
  HiLink javaScriptType			Type
  HiLink javaScriptStatement		Statement
  HiLink javaScriptFunction		Function
  HiLink javaScriptBraces		Function
  HiLink javaScriptError		Error
  HiLink javaScrParenError		javaScriptError
  HiLink javaScriptNull			Keyword
  HiLink javaScriptBoolean		Boolean
  HiLink javaScriptRegexpString		String

  HiLink javaScriptIdentifier		Identifier
  HiLink javaScriptLabel		Label
  HiLink javaScriptException		Exception
  HiLink javaScriptMessage		Keyword
  HiLink javaScriptGlobal		Keyword
  HiLink javaScriptReserved		Error

  HiLink javaScriptStrict		SpecialChar
  HiLink javaScriptStrictS		javaScriptStrict
  HiLink javaScriptStrictD		javaScriptStrict
  HiLink javaScriptTypedArray		Type
  HiLink qmlOn				Keyword
  HiLink qmlChanged			SpecialChar
  HiLink qmlError			Error
  HiLink qmlObjectLiteralType		Type
  HiLink qmlNonBindingColon		NONE
  HiLink qmlBindingProperty		Label
  HiLink qmlPragma			PreProc
  HiLink qmlImport			Include
  HiLink qmlTypeDef			TypeDef
  HiLink qmlDeclaration			Function
  HiLink qmlStorageClass		StorageClass
  HiLink qmlDebug			Debug
  HiLink qmlBasicType			Type
  HiLink qmlAllType			Type

  delcommand HiLink
endif

let b:current_syntax = "qml"
if main_syntax == 'qml'
  unlet main_syntax
endif

" vim: ts=8
