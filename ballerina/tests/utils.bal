// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/io;

isolated function getCopybookPath(string fileName) returns string {
    return string `tests/resources/copybooks/${fileName}.cpy`;
}

isolated function getInputPath(string fileName) returns string {
    return string `tests/resources/copybook-inputs/${fileName}.txt`;
}

isolated function getSchemaPath(string fileName) returns string {
    return string `tests/resources/schema/${fileName}.json`;
}

isolated function getCopybookJsonPath(string fileName) returns string {
    return string `tests/resources/copybook-json/${fileName}.json`;
}

isolated function getErrorDetail(string fileName) returns json|error {
    string filePath = string `tests/resources/errors/${fileName}.json`;
    json errors = check io:fileReadJson(filePath);
    if errors !is map<json> || !errors.hasKey(ERRORS) {
        return error(string `Invalid error fomart in '${filePath}'`);
    }
    return errors;
}
