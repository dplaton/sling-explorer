var Properties = Properties || {};

(function() {

    Properties.MultiValueModal = function(config) {
        console.log('Mutivalue modal on...');
        this.config = config;
        this.modalId = config["id"];
        var dataString = config["dataString"];

        this.dataArray = dataString.split(",");
        this.fieldName = "./" + config["fieldName"];

        this.fieldContainer = $("#" + this.modalId + " #valuesContainer");
        this.valueCount = 0;

        this.attachEvents();
        this.fieldContainer.empty();
        this.render();


    }

    Properties.MultiValueModal.prototype = {

        attachEvents: function() {
            var addValueButton = $("#" + this.modalId + " #addValueButton");
            var modal = this;

            addValueButton.click(function(event) {
                event.preventDefault();
                var inputField = $("#" + modal.modalId + " #newValue");
                var valueToAdd = inputField.val();
                if (valueToAdd.trim() !== "" && typeof valueToAdd !== undefined) {
                    modal.createField({
                        index: modal.valueCount,
                        value: valueToAdd
                    });
                    inputField.val("");
                    modal.valueCount++;
                }
            });
        },

        render: function() {

            var modal = this;

            $.each(this.dataArray, function(index, value) {
                modal.createField({
                    "index": index,
                    "value": value,
                });
                modal.valueCount++;
            });
        },

        createField: function(fieldConfig) {
            var caca = $("<div>").addClass("form-group").appendTo(this.fieldContainer);
            var container = $("<div>").addClass("input-group").appendTo(caca);
            var delIcon = $("<i>").addClass("glyphicon glyphicon-trash");

            var index = fieldConfig["index"];
            var value = fieldConfig["value"];

            var fieldId = "input" + index;
            $("<input>").addClass("form-control input-sm").attr({id: fieldId, name: this.fieldName, value: value.trim()}).appendTo(container);
            var buttonSpan = $("<span>").addClass("input-group-btn").appendTo(container);
            $("<button>").attr({type: "button"}).addClass("btn btn-sm btn-danger")
                .click(function(event) {
                    $("#" + fieldId).parents(".form-group").remove();

                })
                .append(delIcon).appendTo(buttonSpan);
            //container.appendTo(this.fieldContainer);
        }
    }


    Properties.MultiValueModal.create = function(config) {
        return new Properties.MultiValueModal(config);
    }

}());

