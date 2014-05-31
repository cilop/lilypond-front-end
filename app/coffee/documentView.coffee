documentView = angular.module 'documentView', ['musicSVG']

documentView.directive 'documentView', ->
  restrict: 'A'
  require: 'ngModel'
  scope: 
    ngModel: '='
  controller: ['$scope', '$element', '$compile', ($scope, $element, $compile) ->
    $scope.model =
      meta:
        measures: []
      staves: [
        measures: []
      ]
    $scope.model.typing = 'rendering note ..'
    $element.keydown((event) ->
      key = helper.animateKey(event.which)
      # console.log(event.which)
      # console.log(key)

      $scope.model.typing = helper.parseIncomplete($scope.model.input)
      console.log($scope.model.currentDuration)

      if key is 'enter'

        $scope.$emit('dataChanged', $scope.model)
        $scope.model.currentDuration = helper.getDuration($scope.model.input)
        if $scope.model.currentDuration <= 1
        
          console.log('parsing notes')
          notes = helper.parseNotes($scope.model.input)
          
          $scope.model.meta.measures.push({})
          $scope.model.staves[0].measures.push({ notes: notes })
          staffEl = $compile('<svg ng-measure ng-model="measure"  class="document staff"/>')($scope)
          metaEl = $compile('<svg ng-meta-measure ng-model="measure"  class="document staff"/>')($scope)
          $('.staff.top').append(metaEl)
          $('.staff.bottom').append(staffEl)
          $scope.model.input = ''
          $scope.model.typing = 'rendering note ..'

        else 

          alert 'Combination of notes exceeds allowed duration'

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
    </div>
    <div class="displayContainer">
    <input class="staffInput pitch" type="text" ng-model="model.input">
    <p ng-model="model.typing" class="inputDisplay"> {{ model.typing }} </p>
    </div>'
  # link: ($scope) ->
  #   $scope.$watch('model', ->
  #     console.log('model changed')
  #     $scope.$emit('dataChanged', $scope.model)
  #   , true)
