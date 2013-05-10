generateBadgeStates = () ->


Template.componentsHelper.badgeState = (state) ->
	log state
	state

Template.componentsHelper.badgeStateTopicsSingle = () ->
	state: 'topics single'
	message: '6'

Template.componentsHelper.badgeStateTopicsMultiple = () ->
	state: 'topics'
	message: '100'

Template.componentsHelper.badgeStateTopicsMuted = () ->
	state: 'topics muted'
	message: '0'

Template.componentsHelper.badgeTextEntryBoxSingle = () ->
	state: 'textEntryBox single'
	message: '5'

Template.componentsHelper.badgeTextEntryBoxMultiple = () ->
	state: 'textEntryBox'
	message: '400'

Template.componentsHelper.badgeTextEntryBoxMuted = () ->
	state: 'textEntryBox muted'
	message: '0'

Template.componentsHelper.badgeDeployedStatusChanged = () ->
	state: 'changed single'
	message: 'c'

Template.componentsHelper.badgeDeployedStatusDeployed = () ->
	state: 'deployed single'
	message: 'd'

Template.componentsHelper.badgeDeployedStatusSaved = () ->
	state: 'saved single'
	message: 's'

Template.componentsHelper.badgeDragToMoveMultiple = () ->
	state: 'dragToMove'
	message: 'Drag To Move.'

Template.componentsHelper.badgeDragToMoveMuted = () ->
	state: 'dragToMove muted'
	message: 'Drag To Move.'

Template.componentsHelper.buttonContentViewerPreviewMuted = () ->
	state: 'contentViewer preview muted'
	message: 'prvw'

Template.componentsHelper.buttonContentViewerPreviewDefault = () ->
	state: 'contentViewer preview default'
	message: 'prvw'

Template.componentsHelper.buttonContentViewerPreviewHover = () ->
	state: 'contentViewer preview hover'
	message: 'prvw'

Template.componentsHelper.buttonContentViewerPreviewActive = () ->
	state: 'contentViewer preview active'
	message: 'prvw'

Template.componentsHelper.buttonContentViewerImageMuted = () ->
	state: 'contentViewer image muted'
	message: 'imge'

Template.componentsHelper.buttonContentViewerImageDefault = () ->
	state: 'contentViewer image default'
	message: 'imge'

Template.componentsHelper.buttonContentViewerImageHover = () ->
	state: 'contentViewer image hover'
	message: 'imge'

Template.componentsHelper.buttonContentViewerImageActive = () ->
	state: 'contentViewer image active'
	message: 'imge'

Template.componentsHelper.buttonContentViewerMusicMuted = () ->
	state: 'contentViewer music muted'
	message: 'musc'

Template.componentsHelper.buttonContentViewerMusicDefault = () ->
	state: 'contentViewer music default'
	message: 'musc'

Template.componentsHelper.buttonContentViewerMusicHover = () ->
	state: 'contentViewer music hover'
	message: 'musc'

Template.componentsHelper.buttonContentViewerMusicActive = () ->
	state: 'contentViewer music active'
	message: 'musc'

Template.componentsHelper.buttonContentViewerVideoMuted = () ->
	state: 'contentViewer video muted'
	message: 'vdeo'

Template.componentsHelper.buttonContentViewerVideoDefault = () ->
	state: 'contentViewer video default'
	message: 'vdeo'

Template.componentsHelper.buttonContentViewerVideoHover = () ->
	state: 'contentViewer video hover'
	message: 'vdeo'

Template.componentsHelper.buttonContentViewerVideoActive = () ->
	state: 'contentViewer video active'
	message: 'vdeo'

Template.componentsHelper.buttonContentViewerCodeMuted = () ->
	state: 'contentViewer code muted'
	message: 'code'

Template.componentsHelper.buttonContentViewerCodeDefault = () ->
	state: 'contentViewer code default'
	message: 'code'

Template.componentsHelper.buttonContentViewerCodeHover = () ->
	state: 'contentViewer code hover'
	message: 'code'

Template.componentsHelper.buttonContentViewerCodeActive = () ->
	state: 'contentViewer code active'
	message: 'code'

Template.componentsHelper.buttonContentViewerAnalyticsMuted = () ->
	state: 'contentViewer analytics muted'
	message: 'anly'

Template.componentsHelper.buttonContentViewerAnalyticsDefault = () ->
	state: 'contentViewer analytics default'
	message: 'anly'

Template.componentsHelper.buttonContentViewerAnalyticsHover = () ->
	state: 'contentViewer analytics hover'
	message: 'anly'

Template.componentsHelper.buttonContentViewerAnalyticsActive = () ->
	state: 'contentViewer analytics active'
	message: 'anly'

Template.componentsHelper.buttonContentViewerRemixesMuted = () ->
	state: 'contentViewer remixes muted'
	message: 'remx'

Template.componentsHelper.buttonContentViewerRemixesDefault = () ->
	state: 'contentViewer remixes default'
	message: 'remx'

Template.componentsHelper.buttonContentViewerRemixesHover = () ->
	state: 'contentViewer remixes hover'
	message: 'remx'

Template.componentsHelper.buttonContentViewerRemixesActive = () ->
	state: 'contentViewer remixes active'
	message: 'remx'

Template.componentsHelper.buttonContentViewerPlayMuted = () ->
	state: 'contentViewer play muted'
	message: 'play'

Template.componentsHelper.buttonContentViewerPlayDefault = () ->
	state: 'contentViewer play default'
	message: 'play'

Template.componentsHelper.buttonContentViewerPlayHover = () ->
	state: 'contentViewer play hover'
	message: 'play'

Template.componentsHelper.buttonContentViewerPlayActive = () ->
	state: 'contentViewer play active'
	message: 'play'

Template.componentsHelper.buttonSelectFilesMuted = () ->
	state: 'selectFiles muted'
	message: 'Or, Select Files'

Template.componentsHelper.buttonSelectFilesDefault = () ->
	state: 'selectFiles default'
	message: 'Or, Select Files'

Template.componentsHelper.buttonSelectFilesHover = () ->
	state: 'selectFiles hover'
	message: 'Or, Select Files'

Template.componentsHelper.buttonSelectFilesActive = () ->
	state: 'selectFiles active'
	message: 'Or, Select Files'

Template.componentsHelper.buttonCancelMuted = () ->
	state: 'cancel muted'
	message: 'x'

Template.componentsHelper.buttonCancelDefault = () ->
	state: 'cancel default'
	message: 'x'

Template.componentsHelper.buttonCancelHover = () ->
	state: 'cancel hover'
	message: 'x'

Template.componentsHelper.buttonCancelActive = () ->
	state: 'cancel active'
	message: 'x'

Template.componentsHelper.buttonConfirmMuted = () ->
	state: 'confirm muted'
	message: '✔'

Template.componentsHelper.buttonConfirmDefault = () ->
	state: 'confirm default'
	message: '✔'

Template.componentsHelper.buttonConfirmHover = () ->
	state: 'confirm hover'
	message: '✔'

Template.componentsHelper.buttonConfirmActive = () ->
	state: 'confirm active'
	message: '✔'

Template.componentsHelper.buttonExpandCollapseMuted = () ->
	state: 'expandCollapse muted'
	message: '<'

Template.componentsHelper.buttonExpandCollapseDefault = () ->
	state: 'expandCollapse default'
	message: '<'

Template.componentsHelper.buttonExpandCollapseHover = () ->
	state: 'expandCollapse hover'
	message: '<'

Template.componentsHelper.buttonExpandCollapseActive = () ->
	state: 'expandCollapse active'
	message: '<'

Template.componentsHelper.buttonOneColumnLayoutMuted = () ->
	state: 'columnLayout one muted'
	message: '1'

Template.componentsHelper.buttonOneColumnLayoutDefault = () ->
	state: 'columnLayout one default'
	message: '1'

Template.componentsHelper.buttonOneColumnLayoutHover = () ->
	state: 'columnLayout one hover'
	message: '1'

Template.componentsHelper.buttonOneColumnLayoutActive = () ->
	state: 'columnLayout one active'
	message: '1'

Template.componentsHelper.buttonTwoColumnLayoutMuted = () ->
	state: 'columnLayout two muted'
	message: '2'

Template.componentsHelper.buttonTwoColumnLayoutDefault = () ->
	state: 'columnLayout two default'
	message: '2'

Template.componentsHelper.buttonTwoColumnLayoutHover = () ->
	state: 'columnLayout two hover'
	message: '2'

Template.componentsHelper.buttonTwoColumnLayoutActive = () ->
	state: 'columnLayout two active'
	message: '2'

Template.componentsHelper.buttonThreeColumnLayoutMuted = () ->
	state: 'columnLayout three muted'
	message: '3'

Template.componentsHelper.buttonThreeColumnLayoutDefault = () ->
	state: 'columnLayout three default'
	message: '3'

Template.componentsHelper.buttonThreeColumnLayoutHover = () ->
	state: 'columnLayout three hover'
	message: '3'

Template.componentsHelper.buttonThreeColumnLayoutActive = () ->
	state: 'columnLayout three active'
	message: '3'

Template.componentsHelper.buttonGridLayoutMuted = () ->
	state: 'columnLayout grid muted'
	message: 'grid'

Template.componentsHelper.buttonGridLayoutDefault = () ->
	state: 'columnLayout grid default'
	message: 'grid'

Template.componentsHelper.buttonGridLayoutHover = () ->
	state: 'columnLayout grid hover'
	message: 'grid'

Template.componentsHelper.buttonGridLayoutActive = () ->
	state: 'columnLayout grid active'
	message: 'grid'

Template.componentsHelper.buttonRollbackMuted = () ->
	state: 'rollback muted'
	message: 'rlbk'

Template.componentsHelper.buttonRollbackDefault = () ->
	state: 'rollback default'
	message: 'rlbk'

Template.componentsHelper.buttonRollbackHover = () ->
	state: 'rollback hover'
	message: 'rlbk'

Template.componentsHelper.buttonRollbackTransitioning = () ->
	state: 'rollback transitioning'
	message: 'rlbk'

Template.componentsHelper.buttonRollbackActive = () ->
	state: 'rollback active'
	message: 'rlbk'

Template.componentsHelper.buttonPreviewGameMuted = () ->
	state: 'previewGame muted'
	message: 'prvg'

Template.componentsHelper.buttonPreviewGameDefault = () ->
	state: 'previewGame default'
	message: 'prvg'

Template.componentsHelper.buttonPreviewGameHover = () ->
	state: 'previewGame hover'
	message: 'prvg'

Template.componentsHelper.buttonPreviewGameTransitioning = () ->
	state: 'previewGame transitioning'
	message: 'prvg'

Template.componentsHelper.buttonPreviewGameActive = () ->
	state: 'previewGame active'
	message: 'prvg'

Template.componentsHelper.buttonDeployMuted = () ->
	state: 'deploy muted'
	message: 'dply'

Template.componentsHelper.buttonDeployDefault = () ->
	state: 'deploy default'
	message: 'dply'

Template.componentsHelper.buttonDeployHover = () ->
	state: 'deploy hover'
	message: 'dply'

Template.componentsHelper.buttonDeployActive = () ->
	state: 'deploy active'
	message: 'dply'

Template.componentsHelper.buttonRequestToBecomeCollaboratorMuted = () ->
	state: 'requestToBecomeCollaborator muted'
	message: 'Request To Become a Collaborator'

Template.componentsHelper.buttonRequestToBecomeCollaboratorDefault = () ->
	state: 'requestToBecomeCollaborator default'
	message: 'Request To Become a Collaborator'

Template.componentsHelper.buttonRequestToBecomeCollaboratorHover = () ->
	state: 'requestToBecomeCollaborator hover'
	message: 'Request To Become a Collaborator'

Template.componentsHelper.buttonRequestToBecomeCollaboratorActive = () ->
	state: 'requestToBecomeCollaborator active'
	message: 'Request To Become a Collaborator'

Template.componentsHelper.buttonAboutUsernameMuted = () ->
	state: 'aboutUsername muted'
	message: 'About Username'

Template.componentsHelper.buttonAboutUsernameDefault = () ->
	state: 'aboutUsername default'
	message: 'About Username'

Template.componentsHelper.buttonAboutUsernameHover = () ->
	state: 'aboutUsername hover'
	message: 'About Username'

Template.componentsHelper.buttonAboutUsernameActive = () ->
	state: 'aboutUsername active'
	message: 'About Username'

Template.componentsHelper.buttonTakeScreenshotMuted = () ->
	state: 'takeScreenshot muted'
	message: 'tksh'

Template.componentsHelper.buttonTakeScreenshotDefault = () ->
	state: 'takeScreenshot default'
	message: 'tksh'

Template.componentsHelper.buttonTakeScreenshotHover = () ->
	state: 'takeScreenshot hover'
	message: 'tksh'

Template.componentsHelper.buttonTakeScreenshotActive = () ->
	state: 'takeScreenshot active'
	message: 'tksh'

Template.componentsHelper.buttonTakeVideoMuted = () ->
	state: 'takeVideo muted'
	message: 'tkvd'

Template.componentsHelper.buttonTakeVideoDefault = () ->
	state: 'takeVideo default'
	message: 'tkvd'

Template.componentsHelper.buttonTakeVideoHover = () ->
	state: 'takeVideo hover'
	message: 'tkvd'

Template.componentsHelper.buttonTakeVideoActive = () ->
	state: 'takeVideo active'
	message: 'tkvd'

Template.componentsHelper.buttonNotNowMuted = () ->
	state: 'notNow muted'
	message: 'Not Now'

Template.componentsHelper.buttonNotNowDefault = () ->
	state: 'notNow default'
	message: 'Not Now'

Template.componentsHelper.buttonNotNowHover = () ->
	state: 'notNow hover'
	message: 'Not Now'

Template.componentsHelper.buttonNotNowActive = () ->
	state: 'notNow active'
	message: 'Not Now'

Template.componentsHelper.buttonRequestMonetizationMuted = () ->
	state: 'requestMonetization muted'
	message: 'Request Monetization'

Template.componentsHelper.buttonRequestMonetizationDefault = () ->
	state: 'requestMonetization default'
	message: 'Request Monetization'

Template.componentsHelper.buttonRequestMonetizationHover = () ->
	state: 'requestMonetization hover'
	message: 'Request Monetization'

Template.componentsHelper.buttonRequestMonetizationActive = () ->
	state: 'requestMonetization active'
	message: 'Request Monetization'

Template.componentsHelper.circleButtonCloseMuted = () ->
	state: 'circleButton close muted'
	message: 'x'

Template.componentsHelper.circleButtonCloseDefault = () ->
	state: 'circleButton close default'
	message: 'x'

Template.componentsHelper.circleButtonCloseHover = () ->
	state: 'circleButton close hover'
	message: 'x'

Template.componentsHelper.circleButtonCloseTransitioning = () ->
	state: 'circleButton close transitioning'
	message: 'x'

Template.componentsHelper.circleButtonCloseActive = () ->
	state: 'circleButton close active'
	message: 'x'

Template.componentsHelper.circleButtonSearchMuted = () ->
	state: 'circleButton search muted'
	message: 'srch'

Template.componentsHelper.circleButtonSearchDefault = () ->
	state: 'circleButton search default'
	message: 'x'

Template.componentsHelper.circleButtonSearchHover = () ->
	state: 'circleButton search hover'
	message: 'srch'

Template.componentsHelper.circleButtonSearchTransitioning = () ->
	state: 'circleButton search transitioning'
	message: 'srch'

Template.componentsHelper.circleButtonSearchActive = () ->
	state: 'circleButton search active'
	message: 'srch'

Template.componentsHelper.circleButtonFiltersMuted = () ->
	state: 'circleButton filters muted'
	message: 'f'

Template.componentsHelper.circleButtonFiltersDefault = () ->
	state: 'circleButton filters default'
	message: 'x'

Template.componentsHelper.circleButtonFiltersHover = () ->
	state: 'circleButton filters hover'
	message: 'f'

Template.componentsHelper.circleButtonFiltersTransitioning = () ->
	state: 'circleButton filters transitioning'
	message: 'f'

Template.componentsHelper.circleButtonFiltersActive = () ->
	state: 'circleButton filters active'
	message: 'f'

Template.componentsHelper.circleButtonAddMuted = () ->
	state: 'circleButton add muted'
	message: '+'

Template.componentsHelper.circleButtonAddDefault = () ->
	state: 'circleButton add default'
	message: 'x'

Template.componentsHelper.circleButtonAddHover = () ->
	state: 'circleButton add hover'
	message: '+'

Template.componentsHelper.circleButtonAddTransitioning = () ->
	state: 'circleButton add transitioning'
	message: '+'

Template.componentsHelper.circleButtonAddActive = () ->
	state: 'circleButton add active'
	message: '+'

Template.componentsHelper.circleButtonSettingsMuted = () ->
	state: 'circleButton settings muted'
	message: 'stng'

Template.componentsHelper.circleButtonSettingsDefault = () ->
	state: 'circleButton settings default'
	message: 'x'

Template.componentsHelper.circleButtonSettingsHover = () ->
	state: 'circleButton settings hover'
	message: 'stng'

Template.componentsHelper.circleButtonSettingsTransitioning = () ->
	state: 'circleButton settings transitioning'
	message: 'stng'

Template.componentsHelper.circleButtonSettingsActive = () ->
	state: 'circleButton settings active'
	message: 'stng'
