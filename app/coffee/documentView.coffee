documentView = angular.module 'documentView', ['musicSVG']

documentView.directive 'documentView', ->
  restrict: 'A'
  require: 'ngModel'
  scope: 
    ngModel: '='
  controller: ['$scope', '$element', '$compile', ($scope, $element, $compile) ->
    $scope.test = ''
    $scope.model =
      meta:
        measures: [{},{}]
      staves: [
        measures: [
          {notes: [
            {pitch: 69, duration: {n: 1, d: 4}}
            {pitch: 70, duration: {n: 1, d: 2}}
            {pitch: 71, duration: {n: 1, d: 4}}
          ]}
          {notes: [
            {pitch: 71, duration: {n: 1, d: 2}}
            {pitch: 72, duration: {n: 1, d: 4}}
            {pitch: 73, duration: {n: 1, d: 4}}
          ]}
        ]
      ]
    $element.keydown((event) ->
      key = helper.animateKey(event.which)
      if key is 'z'
        console.log($scope.model)
        $scope.model.meta.measures.push({})
        $scope.model.staves[0].measures.push({ notes: [new helper.note(69, 1, 4), new helper.note(70,1,2), new helper.note(71,1,4)] })

        staffEl = $compile('<svg ng-measure ng-model="measure" size="{{width($index)}}" class="document staff"/>')($scope)
        metaEl = $compile('<svg ng-meta-measure ng-model="measure" size="{{width($index)}}" class="document staff"/>')($scope)
        # el = $compile('<div ng-track tabindex="0"></div>')($scope)
        # $element.parent().append(el)
        console.log 'metaEl'
        console.log(metaEl)
        $('.staff.top').append(metaEl)
        $('.staff.bottom').append(staffEl)
      else
        console.log(key)
        # $scope.test += key
      )
    $scope.width = (measureIndex) ->
      _.max _($scope.model.staves).map (staff) ->
        2 * staff.measures[measureIndex].notes.length + 1
  ]
  template:
    '<div class="staff top">
      <svg ng-meta-measure ng-repeat="measure in model.meta.measures"
        ng-model="measure" size="{{width($index)}}" class="document staff"/>
    </div>
    <br>
    <div class="staff bottom">
      <svg ng-measure ng-repeat="measure in model.staves[0].measures"
        ng-model="measure" size="{{width($index)}}" class="document staff"/>
    </div>'
    # <input class="staffInput" type="text" ng-model="model.test">
  link: ($scope) ->
    window.data = $scope.model
    console.log($scope.model)
    $scope.$watch('model', ->
      console.log('model changed')
    , true)
