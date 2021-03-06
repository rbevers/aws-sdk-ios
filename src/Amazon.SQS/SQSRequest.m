/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "SQSRequest.h"
#import "AmazonAuthUtils.h"


@implementation SQSRequest

-(NSString *)endpoint
{
    return [parameters valueForKey:@"QueueUrl"];
}


-(void)setEndpoint:(NSString *)theEndpoint
{
    [parameters setValue:theEndpoint forKey:@"QueueUrl"];
}

-(void)sign {
    // headers to sign
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    [headers setObject:self.hostName forKey:@"Host"];
    
    [AmazonAuthUtils signRequestV4:self headers:headers payload:[self queryString] credentials:self.credentials];
}


@end
