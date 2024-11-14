InputRow(
                aHeight: rowHeight,
                child: Row(
                  children: <Widget>[
                    spaceBetween,
                    InputRowBox1(
                        columnWidth: col1,
                        inputDrillCriteria1: widget.inputDrillCriteria3),
                    SizedBox(
                      width: col2,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.headlineMedium!,
                        decoration: inputDecoration,
                        keyboardType: TextInputType.number,
                        onSaved: (value) =>
                            _successfulPutts = int.parse(value!),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return widget.errorInputMessageNonEmptyNegativ;
                          }
                          if (_successfulPutts < 0) {
                            return widget.errorInputMessageNonEmptyNegativ;
                          }
                          if (_successfulPutts > _putts) {
                            return 'Number of successful putts cannot be more than number of putts';
                          }
                          return null;
                        },
                      ),
                    ),
                    spaceBetween,
                    SizedBox(
                      width: col3,
                      child: Text(
                        widget.drillInput3,
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                    ),
                  ],
                ),
              ),