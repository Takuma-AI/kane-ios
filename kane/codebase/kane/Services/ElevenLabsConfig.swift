import Foundation

// Configuration for ElevenLabs API
struct ElevenLabsConfig {
    // Agent configuration
    // For public agents: Just use the agent ID directly
    // For private agents: You'll need a backend server to generate signed URLs
    
    // Current agent ID - can be public or private
    // TODO: Replace with your actual agent ID when ready
    static let agentId = ProcessInfo.processInfo.environment["ELEVENLABS_AGENT_ID"] ?? "agent_8401k3ywmrm1fsrtb1etpn74kw9e"
    
    // Backend server URL for getting signed URLs (for private agents)
    // Leave empty if using a public agent
    static let backendUrl = ProcessInfo.processInfo.environment["BACKEND_URL"] ?? ""
    
    // Check if using private agent (requires backend)
    static var isPrivateAgent: Bool {
        return !backendUrl.isEmpty
    }
    
    // Get signed URL from your backend server
    // Your backend should:
    // 1. Have the ElevenLabs API key stored securely
    // 2. Call ElevenLabs API to get a signed URL
    // 3. Return the signed URL to this app
    static func getSignedUrl() async throws -> String? {
        guard isPrivateAgent else {
            // Public agent - no signed URL needed
            return nil
        }
        
        // TODO: Implement actual backend call
        // Example structure:
        // let url = URL(string: "\(backendUrl)/api/elevenlabs/signed-url")!
        // let (data, _) = try await URLSession.shared.data(from: url)
        // let response = try JSONDecoder().decode(SignedUrlResponse.self, from: data)
        // return response.signedUrl
        
        print("⚠️ Private agent configuration detected but backend not implemented")
        return nil
    }
}

// Extension to help with secure storage (future enhancement)
extension ElevenLabsConfig {
    // In a production app, you'd store credentials in Keychain
    static func storeCredentials(apiKey: String, agentId: String) {
        // TODO: Implement keychain storage
        UserDefaults.standard.set(apiKey, forKey: "elevenlabs_api_key")
        UserDefaults.standard.set(agentId, forKey: "elevenlabs_agent_id")
    }
    
    static func loadStoredCredentials() -> (apiKey: String?, agentId: String?) {
        let apiKey = UserDefaults.standard.string(forKey: "elevenlabs_api_key")
        let agentId = UserDefaults.standard.string(forKey: "elevenlabs_agent_id")
        return (apiKey, agentId)
    }
    
    static func clearCredentials() {
        UserDefaults.standard.removeObject(forKey: "elevenlabs_api_key")
        UserDefaults.standard.removeObject(forKey: "elevenlabs_agent_id")
    }
}